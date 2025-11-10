using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Token
{
    public class RefreshTokenRequest : IRequest<string>
    {
        public required string RefreshToken { get; init; }
    }
}
