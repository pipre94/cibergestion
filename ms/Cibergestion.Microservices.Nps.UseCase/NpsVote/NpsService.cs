using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote
{
    public class NpsService : INpsService
    {
        public int CalculateNps(IEnumerable<VoteResultDto> votes)
        {
            if (!votes.Any()) return 0;

            int promoters = votes.Count(v => v.Score >= 9 && v.Score <= 10);
            int detractors = votes.Count(v => v.Score >= 0 && v.Score <= 6);
            int total = votes.Count();

            double nps = ((double)(promoters - detractors) / total) * 100;

            return (int)Math.Round(nps);
        }
    }
}
