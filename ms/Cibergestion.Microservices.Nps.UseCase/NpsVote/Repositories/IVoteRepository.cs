using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;

namespace Cibergestion.Microservices.Nps.UseCase.Nps.Repositories
{
    public interface IVoteRepository
    {
        Task<VoteEntity> CreateAsync(VoteEntity vote, CancellationToken cancellationToken);
        Task<IEnumerable<VoteResultDto>> GetAllAsync(CancellationToken cancellationToken);
        Task<VoteResultDto?> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
        Task<bool> UserHasVotedAsync(int userId, CancellationToken cancellationToken);
    }
}