namespace Cibergestion.Microservices.Nps.UseCase.Entities
{
    public class UserRoleEntity
    {
        public int Id { get;  }
        public int UserId { get; init; }

        public int RoleId { get; init; }

        public UserEntity? User { get; init; }

        public RoleEntity? Role { get; init; }
    }
}
