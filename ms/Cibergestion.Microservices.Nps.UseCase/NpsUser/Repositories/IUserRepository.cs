using Cibergestion.Microservices.Nps.UseCase.Entities;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Repositories
{
    public interface IUserRepository
    {
        Task<int> CreateAsync(UserEntity user, CancellationToken cancellationToken);
        Task<IEnumerable<UserEntity>> GetAllAsync(CancellationToken cancellationToken);
        Task<UserEntity?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<UserEntity?> GetByUsernameAsync(string username, CancellationToken cancellationToken);
        Task<bool> ExistsAsync(string username, CancellationToken cancellationToken);
    }
}