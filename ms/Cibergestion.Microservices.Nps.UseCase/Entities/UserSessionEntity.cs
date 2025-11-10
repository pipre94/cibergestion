namespace Cibergestion.Microservices.Nps.UseCase.Entities
{
    public class UserSessionEntity
    {
        public int Id { get;  }

        public int UserId { get; init; }

        public required string AccessToken { get; init; } 
        public required string RefreshToken { get; init; } 

        public DateTime CreatedAt { get; init; } = DateTime.UtcNow;

        public DateTime LastActivityAt { get; set; } = DateTime.UtcNow;

        public DateTime ExpiresAt { get; init; } = DateTime.UtcNow.AddMinutes(5);

        public bool IsRevoked { get; set; } = false;

        public UserEntity User { get; init; }
    }
}
