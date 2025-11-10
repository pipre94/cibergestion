using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.GetNps
{
    public class GetNpsQuery : IRequest<int>
    {
    }
}
