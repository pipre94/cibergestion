using Cibergestion.Microservices.Nps.UseCase.Data.Configuration;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Microsoft.EntityFrameworkCore;

namespace Cibergestion.Microservices.Nps.UseCase.Data
{
    public class NpsContext : DbContext
    {
        public DbSet<UserEntity> Users { get; set; }
        public DbSet<RoleEntity> Roles { get; set; }
        public DbSet<UserRoleEntity> UserRoles { get; set; }
        public DbSet<VoteEntity> Votes { get; set; }
        public DbSet<UserSessionEntity> UserSessions { get; set; }

        public NpsContext(DbContextOptions options)
           : base(options)
        {
            ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new RoleConfiguration());
            modelBuilder.ApplyConfiguration(new UserRoleConfiguration());
            modelBuilder.ApplyConfiguration(new VoteConfiguration());
            modelBuilder.ApplyConfiguration(new UserSessionConfiguration());
        }
    }
}