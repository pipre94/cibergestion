using Cibergestion.Microservices.Nps.UseCase.Auth.Repositories;
using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.Auth.Logout
{

    public class LogoutHandler : IRequestHandler<LogoutRequest, Unit>
    {
        private readonly IAuthRepository _authRepository;

        public LogoutHandler(IAuthRepository authRepository)
        {
            _authRepository = authRepository;
        }

        public async Task<Unit> Handle(LogoutRequest request, CancellationToken cancellationToken)
        {
            var session = await _authRepository.GetActiveSessionByRefreshTokenAsync(request.RefreshToken, cancellationToken);

            if (session is null)
                throw new UnauthorizedAccessException("Token de sesión inválido o ya revocado.");

            await _authRepository.RevokeSessionAsync(session, cancellationToken);

            return Unit.Value;
        }
    }
}
