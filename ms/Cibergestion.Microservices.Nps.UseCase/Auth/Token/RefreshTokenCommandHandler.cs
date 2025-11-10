using Cibergestion.Microservices.Nps.UseCase.Auth.Repositories;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Services;
using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Token
{
    public class RefreshTokenHandler : IRequestHandler<RefreshTokenRequest, string>
    {
        private readonly IAuthRepository _authRepository;
        private readonly ITokenService _tokenService;

        public RefreshTokenHandler(IAuthRepository authRepository, ITokenService tokenService)
        {
            _authRepository = authRepository;
            _tokenService = tokenService;
        }

        public async Task<string> Handle(RefreshTokenRequest request, CancellationToken cancellationToken)
        {
            var session = await _authRepository.GetValidSessionAsync(request.RefreshToken, cancellationToken);

            if (session == null || session.ExpiresAt < DateTime.UtcNow)
                throw new UnauthorizedAccessException("Token inválido o expirado.");

            var (access, refresh) = _tokenService.GenerateTokens(session.User!);

            session.IsRevoked = true;

            var newSession = new UserSessionEntity
            {
                UserId = session.UserId,
                AccessToken = access,
                RefreshToken = refresh,
                ExpiresAt = DateTime.UtcNow.AddMinutes(5),
                LastActivityAt = DateTime.UtcNow
            };


            await _authRepository.AddAsync(newSession, cancellationToken);

            return access;
        }
    }
}
