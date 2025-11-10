namespace Cibergestion.Microservices.Nps.UseCase.NpsRoles.Services
{
    public interface IPasswordHasher
    {
        string Hash(string password);
        bool Verify(string password, string storedHash);
    }
}