using Cibergestion.Microservices.Nps.UseCase.Nps.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;
using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.GetNps
{
    public class GetNpsQueryHandler : IRequestHandler<GetNpsQuery, int>
    {
        private readonly INpsService _npsServices;
        private readonly IMediator _mediator;
        public GetNpsQueryHandler(INpsService npsService, IMediator mediator)
        {
            _npsServices = npsService;
            _mediator = mediator;
        }
        public async Task<int> Handle(GetNpsQuery request, CancellationToken cancellationToken)
        {
            var votes = await _mediator.Send(new GetVotesQuery(), cancellationToken);

            var calculateNps = _npsServices.CalculateNps(votes);

            return calculateNps;
        }
    }
}
