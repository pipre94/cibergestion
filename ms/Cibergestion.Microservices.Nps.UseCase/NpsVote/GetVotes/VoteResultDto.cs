namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes
{
    public class VoteResultDto
    {
        public required string Name { get; set; }
        public int Score { get; set; }
        public DateTime Created { get; set; }
    }
}
