using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Cibergestion.Microservices.Nps.UseCase.Data.Configuration
{
    public class UserConfiguration : IEntityTypeConfiguration<UserEntity>
    {
        public void Configure(EntityTypeBuilder<UserEntity> builder)
        {
            builder.ToTable("Users", "Nps");

            builder.HasKey(q => q.Id);

            builder.Property(q => q.Id).ValueGeneratedOnAdd();
            builder.Property(q => q.Username).IsRequired().HasMaxLength(100);
            builder.Property(q => q.PasswordHash).IsRequired().HasMaxLength(256);
            builder.Property(q => q.FailedLoginAttempts);
            builder.Property(q => q.IsLocked).IsRequired();
            builder.Property(q => q.CreatedAt).IsRequired();

            builder.HasMany(u => u.UserRoles)
                   .WithOne(ur => ur.User)
                   .HasForeignKey(ur => ur.UserId)
                   .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(u => u.UserSessions)
                   .WithOne(us => us.User)
                   .HasForeignKey(us => us.UserId)
                   .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne(u => u.Vote)
                   .WithOne(v => v.User)
                   .HasForeignKey<VoteEntity>(v => v.UserId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
