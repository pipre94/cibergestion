using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Cibergestion.Microservices.Nps.UseCase.Data.Configuration
{
    public class VoteConfiguration : IEntityTypeConfiguration<VoteEntity>
    {
        public void Configure(EntityTypeBuilder<VoteEntity> builder)
        {
            builder.ToTable("Votes", "Nps");
            builder.HasKey(q => q.Id);
            builder.Property(q => q.Id).ValueGeneratedOnAdd();
            builder.Property(q => q.UserId).IsRequired();
            builder.Property(q => q.Score).IsRequired();
            builder.Property(q => q.CreatedAt).IsRequired();

            builder.HasOne(v => v.User)
                   .WithOne(u => u.Vote)
                   .HasForeignKey<VoteEntity>(v => v.UserId)
                   .OnDelete(DeleteBehavior.Cascade);

            builder.HasIndex(v => v.UserId)
                   .IsUnique();
        }
    }
}
