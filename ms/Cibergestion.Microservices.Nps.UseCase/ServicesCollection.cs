using Cibergestion.Microservices.Nps.UseCase.Auth.Repositories;
using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Nps.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Services;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Services;
using Cibergestion.Microservices.Nps.UseCase.NpsVote;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Cibergestion.Microservices.Nps.UseCase
{
    public static class ServicesCollection
    {
        public static IServiceCollection AddNpsServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContextFactory<NpsContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            });

            services.AddScoped<IVoteRepository, VoteRepository>();
            services.AddScoped<IRoleRepository, RoleRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IPasswordHasher, PasswordHasher>();
            services.AddScoped<ITokenService, TokenService>();
            services.AddScoped<IAuthRepository, AuthRepository>();
            services.AddScoped<INpsService, NpsService>();



            services.AddMediatR(cfg => cfg.RegisterServicesFromAssembly(typeof(ServicesCollection).Assembly));

            return services;
        }
    }
}
