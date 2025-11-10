using Cibergestion.Microservices.Nps.UseCase.Auth.Repositories;
using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Services;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Repositories;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Auth
{
    public class AuthenticateUserCommandHandler : IRequestHandler<AuthenticateUserRequest, AuthenticateUserResponse>
    {
        private readonly IUserRepository _userRepository;
        private readonly IAuthRepository _authRepository;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IConfiguration _config;

        public AuthenticateUserCommandHandler(
            IUserRepository userRepository,
            IAuthRepository authRepository,
            IPasswordHasher passwordHasher,
            IConfiguration config)
        {
            _userRepository = userRepository;
            _authRepository = authRepository;
            _passwordHasher = passwordHasher;
            _config = config;
        }

        public async Task<AuthenticateUserResponse> Handle(AuthenticateUserRequest request, CancellationToken cancellationToken)
        {
            var user = await _userRepository.GetByUsernameAsync(request.Username, cancellationToken);

            if (user is null)
                throw new UnauthorizedAccessException("Usuario o contraseña inválidos.");

            if (user.IsLocked)
                throw new UnauthorizedAccessException("La cuenta está bloqueada por intentos fallidos.");

            if (!_passwordHasher.Verify(request.Password, user.PasswordHash))
            {
                var newAttempts = user.FailedLoginAttempts + 1;
                var isLocked = newAttempts >= 3;

                await _authRepository.UpdateFailedLoginAsync(user, newAttempts, isLocked, cancellationToken);

                throw new UnauthorizedAccessException(isLocked
                    ? "Cuenta bloqueada por múltiples intentos fallidos."
                    : "Usuario o contraseña inválidos.");
            }

            await _authRepository.ResetFailedLoginAsync(user, cancellationToken);

            var accessToken = GenerateJwtToken(user);
            var refreshToken = Guid.NewGuid().ToString("N");

            var session = new UserSessionEntity
            {
                UserId = user.Id,
                AccessToken = accessToken,
                RefreshToken = refreshToken,
                CreatedAt = DateTime.UtcNow,
                LastActivityAt = DateTime.UtcNow,
                ExpiresAt = DateTime.UtcNow.AddMinutes(5)
            };

            await _authRepository.CreateSessionAsync(session, cancellationToken);

            return new AuthenticateUserResponse
            {
                AccessToken = accessToken,
                RefreshToken = refreshToken,
                ExpiresAt = session.ExpiresAt
            };
        }

        private string GenerateJwtToken(UserEntity user)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]!));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new(ClaimTypes.Name, user.Username),
        };

            foreach (var role in user.UserRoles.Select(ur => ur.Role.Name))
                claims.Add(new Claim(ClaimTypes.Role, role));

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(5),
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }

}
