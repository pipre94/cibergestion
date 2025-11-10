using Cibergestion.Microservices.Nps.UseCase.Entities;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.Services
{
    public interface ITokenService
    {
        (string AccessToken, string RefreshToken) GenerateTokens(UserEntity user);
    }
}