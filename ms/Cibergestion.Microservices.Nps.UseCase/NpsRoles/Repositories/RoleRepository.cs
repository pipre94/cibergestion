using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsRoles.Repositories
{
    public class RoleRepository : IRoleRepository
    {
        private readonly IDbContextFactory<NpsContext> _dbContextFactory;

        public RoleRepository(IDbContextFactory<NpsContext> dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }

        public async Task<IEnumerable<RoleEntity>> GetAllAsync(CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken);

            return await context.Roles
                .AsNoTracking()
                .OrderBy(r => r.Name)
                .ToListAsync(cancellationToken);
        }

        public async Task<RoleEntity?> GetByIdAsync(int id, CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken);

            return await context.Roles
                .Include(r => r.UserRoles)
                .ThenInclude(ur => ur.User)
                .AsNoTracking()
                .FirstOrDefaultAsync(r => r.Id == id, cancellationToken);
        }

        public async Task<RoleEntity?> GetByNameAsync(string name, CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken);

            return await context.Roles
                .Include(r => r.UserRoles)
                .ThenInclude(ur => ur.User)
                .AsNoTracking()
                .FirstOrDefaultAsync(r => r.Name == name, cancellationToken);
        }

        public async Task<int> CreateAsync(RoleEntity role, CancellationToken cancellationToken)
        {
            await using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken);

            context.Roles.Add(role);
            await context.SaveChangesAsync(cancellationToken);

            return role.Id;
        }
    }
}
