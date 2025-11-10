using Cibergestion.Microservices.Nps.UseCase.Entities;

namespace Cibergestion.Microservices.Nps.UseCase.Auth.Repositories
{
    public interface IAuthRepository
    {
        Task AddAsync(UserSessionEntity session, CancellationToken cancellationToken);
        Task<UserSessionEntity?> GetValidSessionAsync(string refreshToken, CancellationToken cancellationToken);
        Task UpdateFailedLoginAsync(UserEntity user, int failedAttempts, bool isLocked, CancellationToken cancellationToken);
        Task ResetFailedLoginAsync(UserEntity user, CancellationToken cancellationToken);
        Task<int> CreateSessionAsync(UserSessionEntity session, CancellationToken cancellationToken);
        Task<UserSessionEntity?> GetActiveSessionByRefreshTokenAsync(string refreshToken, CancellationToken cancellationToken);
        Task RevokeSessionAsync(UserSessionEntity session, CancellationToken cancellationToken);
    }
}