using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Auth
{
    public class AuthenticateUserResponse
    {
        public required string AccessToken { get; init; }
        public required string RefreshToken { get; init; }
        public DateTime ExpiresAt { get; init; }
    }
}
