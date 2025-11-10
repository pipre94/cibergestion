using Cibergestion.Microservices.Nps.UseCase.Entities;

namespace Cibergestion.Microservices.Nps.UseCase.NpsRoles.Repositories
{
    public interface IRoleRepository
    {
        Task<IEnumerable<RoleEntity>> GetAllAsync(CancellationToken cancellationToken);
        Task<RoleEntity?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<RoleEntity?> GetByNameAsync(string name, CancellationToken cancellationToken);
        Task<int> CreateAsync(RoleEntity role, CancellationToken cancellationToken);
    }
}
