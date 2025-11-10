using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.Auth.Logout
{
    public class LogoutRequest : IRequest<Unit>
    {
        public required string RefreshToken { get; init; }
    }
}
