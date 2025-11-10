using Microsoft.EntityFrameworkCore;

namespace Cibergestion.Microservices.Nps.UseCase.Entities
{
    public class VoteEntity
    {
        public int Id { get; }

        public int UserId { get; init; }

        public byte Score { get; init; } 

        public DateTime CreatedAt { get; init; } = DateTime.UtcNow;

        public UserEntity? User { get; set; }
    }
}
