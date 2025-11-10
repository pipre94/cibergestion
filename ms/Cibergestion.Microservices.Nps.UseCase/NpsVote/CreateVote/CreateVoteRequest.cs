using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.CreateVote
{
    public record CreateVoteRequest : IRequest<Result>
    {
        public int UserId { get; set; }
        public byte Score { get; set; }
    }
}
