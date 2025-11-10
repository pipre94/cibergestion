namespace Cibergestion.Microservices.Nps.UseCase.Entities
{
    public class UserEntity
    {
        public int Id { get; }

        public required string Username { get; init; }

        public required string PasswordHash { get; init; }

        public int FailedLoginAttempts { get; init; } = 0;

        public bool IsLocked { get; init; }

        public DateTime CreatedAt { get; init; } = DateTime.UtcNow;

        public ICollection<UserRoleEntity> UserRoles { get; set; } = new List<UserRoleEntity>();

        public ICollection<UserSessionEntity> UserSessions { get; set; } = new List<UserSessionEntity>();

        public VoteEntity? Vote { get; set; }
    }
}
