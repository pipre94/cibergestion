namespace Cibergestion.Microservices.Nps.UseCase.Entities
{
    public class RoleEntity
    {
        public int Id { get; }

        public required string Name { get; init; }

        public string? Description { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public ICollection<UserRoleEntity> UserRoles { get; init; } = new List<UserRoleEntity>();
    }
}
