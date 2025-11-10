using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Auth
{
    public class AuthenticateUserRequest : IRequest<AuthenticateUserResponse>
    {
        public required string Username { get; init; }
        public required string Password { get; init; }
    }
}
