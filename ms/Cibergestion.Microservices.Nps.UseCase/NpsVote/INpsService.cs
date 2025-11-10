using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote
{
    public interface INpsService
    {
        int CalculateNps(IEnumerable<VoteResultDto> votes);
    }
}