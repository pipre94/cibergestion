using Cibergestion.Microservices.Nps.UseCase.Nps.Repositories;
using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes
{
    public class GetVotesQueryHandler : IRequestHandler<GetVotesQuery, IEnumerable<VoteResultDto>>
    {
        private readonly IVoteRepository _voteRepository;

        public GetVotesQueryHandler(IVoteRepository voteRepository)
        {
            _voteRepository = voteRepository;
        }

        public async Task<IEnumerable<VoteResultDto>> Handle(GetVotesQuery request, CancellationToken cancellationToken)
        {
            var results = await _voteRepository.GetAllAsync(cancellationToken);
            return results;
        }
    }
}
