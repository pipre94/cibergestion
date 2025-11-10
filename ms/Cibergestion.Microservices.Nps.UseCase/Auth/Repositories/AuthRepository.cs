using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;

namespace Cibergestion.Microservices.Nps.UseCase.Auth.Repositories
{
    public class AuthRepository : IAuthRepository
    {
        private readonly IDbContextFactory<NpsContext> _dbContextFactory;

        public AuthRepository(IDbContextFactory<NpsContext> dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }

        public async Task<UserSessionEntity?> GetValidSessionAsync(string refreshToken, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            return await context.UserSessions
                .Include(s => s.User)
                    .ThenInclude(u => u.UserRoles)
                        .ThenInclude(ur => ur.Role)
                .FirstOrDefaultAsync(s =>
                    s.RefreshToken == refreshToken &&
                    !s.IsRevoked,
                    cancellationToken);
        }

        public async Task AddAsync(UserSessionEntity session, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            context.UserSessions.Add(session);
            await context.SaveChangesAsync();
        }

        public async Task UpdateFailedLoginAsync(UserEntity user, int failedAttempts, bool isLocked, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            context.Users.Attach(user);
            context.Entry(user).Property(u => u.FailedLoginAttempts).CurrentValue = failedAttempts;
            context.Entry(user).Property(u => u.IsLocked).CurrentValue = isLocked;

            await context.SaveChangesAsync();
        }

        public async Task ResetFailedLoginAsync(UserEntity user, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            context.Users.Attach(user);
            context.Entry(user).Property(u => u.FailedLoginAttempts).CurrentValue = 0;

            await context.SaveChangesAsync();
        }

        public async Task<int> CreateSessionAsync(UserSessionEntity session, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            context.UserSessions.Add(session);
            await context.SaveChangesAsync();
            return session.Id;
        }

        public async Task<UserSessionEntity?> GetActiveSessionByRefreshTokenAsync(string refreshToken, CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            return await context.UserSessions
                .FirstOrDefaultAsync(s => s.RefreshToken == refreshToken && !s.IsRevoked, cancellationToken);
        }

        public async Task RevokeSessionAsync(UserSessionEntity session, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            context.UserSessions.Attach(session);
            context.Entry(session).Property(s => s.IsRevoked).CurrentValue = true;
            await context.SaveChangesAsync();
        }

    }
}
