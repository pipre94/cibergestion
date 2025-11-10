using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly IDbContextFactory<NpsContext> _dbContextFactory;

        public UserRepository(IDbContextFactory<NpsContext> contextFactory)
        {
            _dbContextFactory = contextFactory;
        }


        public async Task<UserEntity?> GetByUsernameAsync(string username, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            return await context.Users
                .Include(u => u.UserRoles)
                    .ThenInclude(ur => ur.Role)
                .FirstOrDefaultAsync(u => u.Username == username);
        }

        public async Task<UserEntity?> GetByIdAsync(int id, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            return await context.Users
                .Include(u => u.UserRoles)
                    .ThenInclude(ur => ur.Role)
                .FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task<IEnumerable<UserEntity>> GetAllAsync(CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            return await context.Users
                .Include(u => u.UserRoles)
                    .ThenInclude(ur => ur.Role)
                .ToListAsync();
        }

        public async Task<int> CreateAsync(UserEntity user, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            context.Users.Add(user);
            await context.SaveChangesAsync();
            return user.Id;
        }

        public async Task<bool> ExistsAsync(string username, CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken);

            return await context.Users
                .AnyAsync(u => u.Username == username, cancellationToken);
        }

    }
}
