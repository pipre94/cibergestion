using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Cibergestion.Microservices.Nps.UseCase.Data.Configuration
{
    public class RoleConfiguration : IEntityTypeConfiguration<RoleEntity>
    {
        public void Configure(EntityTypeBuilder<RoleEntity> builder)
        {
            builder.ToTable("Roles", "Nps");

            builder.HasKey(q => q.Id);

            builder.Property(q => q.Id).ValueGeneratedOnAdd();
            builder.Property(q => q.Name).IsRequired().HasMaxLength(50);
            builder.Property(q => q.Description).IsRequired().HasMaxLength(200);
            builder.Property(q => q.CreatedAt).IsRequired();

            builder.HasMany(r => r.UserRoles)
                   .WithOne(ur => ur.Role)
                   .HasForeignKey(ur => ur.RoleId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
