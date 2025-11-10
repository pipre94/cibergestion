using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;
using Microsoft.EntityFrameworkCore;

namespace Cibergestion.Microservices.Nps.UseCase.Nps.Repositories
{
    public class VoteRepository : IVoteRepository
    {
        private readonly IDbContextFactory<NpsContext> _dbContextFactory;

        public VoteRepository(IDbContextFactory<NpsContext> contextFactory)
        {
            _dbContextFactory = contextFactory;
        }
        public async Task<VoteResultDto?> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            var query = from v in context.Votes
                        join u in context.Users on v.UserId equals u.Id
                        where v.UserId == userId
                        select new VoteResultDto()
                        {
                            Name = u.Username,
                            Score = v.Score,
                            Created = v.CreatedAt
                        };
            return await query.FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<VoteResultDto>> GetAllAsync(CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            var query = from v in context.Votes
                        join u in context.Users on v.UserId equals u.Id
                        select new VoteResultDto() 
                        { 
                            Name = u.Username,
                            Score = v.Score,
                            Created = v.CreatedAt
                        };

            return await query.ToListAsync();
        }

        public async Task<bool> UserHasVotedAsync(int userId, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);

            return await context.Votes.AnyAsync(v => v.UserId == userId, cancellationToken);
        }

        public async Task<VoteEntity> CreateAsync(VoteEntity vote, CancellationToken cancellationToken)
        {
            using var context = await _dbContextFactory.CreateDbContextAsync(cancellationToken).ConfigureAwait(false);
            context.Votes.Add(vote);
            await context.SaveChangesAsync(cancellationToken);

            return vote;
        }

    }
}
