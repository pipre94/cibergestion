using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Cibergestion.Microservices.Nps.UseCase.Data.Configuration
{
    public class UserSessionConfiguration : IEntityTypeConfiguration<UserSessionEntity>
    {
        public void Configure(EntityTypeBuilder<UserSessionEntity> builder)
        {
            builder.ToTable("UserSessions", "Nps");

            builder.HasKey(q => q.Id);
            builder.Property(q => q.Id).ValueGeneratedOnAdd();

            builder.Property(q => q.AccessToken).IsRequired().HasMaxLength(512);
            builder.Property(q => q.RefreshToken).IsRequired().HasMaxLength(512);
            builder.Property(q => q.CreatedAt).IsRequired();
            builder.Property(q => q.LastActivityAt).IsRequired();
            builder.Property(q => q.ExpiresAt).IsRequired();
            builder.Property(q => q.IsRevoked).IsRequired().HasDefaultValue(false);

            builder.HasOne(q => q.User)
                   .WithMany(u => u.UserSessions)
                   .HasForeignKey(q => q.UserId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
