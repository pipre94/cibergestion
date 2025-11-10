using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Services;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsRoles.CreateRoles
{
    public class CreateDefaultCommandHandler : IRequestHandler<CreateRolesRequest, Unit>
    {
        //private readonly IRoleRepository _context;
        private readonly IPasswordHasher _hasher;

        public CreateDefaultCommandHandler(IPasswordHasher hasher)
        {
            //_context = context;
            _hasher = hasher;
        }

        public async Task<Unit> Handle(CreateRolesRequest request, CancellationToken cancellationToken)
        {

            //var defaultRoles = new[]
            //{
            //    new RoleEntity { Name = "Admin", Description = "Administrador", CreatedAt = DateTime.UtcNow },
            //    new RoleEntity { Name = "Voter", Description = "Votante", CreatedAt = DateTime.UtcNow }
            //};

            //foreach (var role in defaultRoles)
            //{
            //    var exists = await _context.Roles.AnyAsync(r => r.Name == role.Name, cancellationToken);
            //    if (!exists)
            //        _context.Roles.Add(role);
            //}

            //await _context.SaveChangesAsync(cancellationToken);

            //if (request.IncludeDefaultUsers)
            //{
            //    await CreateDefaultUserIfNotExists(
            //        "admin",
            //        "Admin123*",
            //        new[] { "Admin" },
            //        cancellationToken);

            //    await CreateDefaultUserIfNotExists(
            //        "voter",
            //        "Voter123*",
            //        new[] { "Voter" },
            //        cancellationToken);
            //}

            return Unit.Value;
        }

        //private async Task CreateDefaultUserIfNotExists(
        //    string username,
        //    string password,
        //    IEnumerable<string> roles,
        //    CancellationToken cancellationToken)
        //{
        //    var exists = await _context.Users
        //        .Include(u => u.UserRoles)
        //        .ThenInclude(ur => ur.Role)
        //        .FirstOrDefaultAsync(u => u.Username == username, cancellationToken);

        //    if (exists != null) return;

        //    var hashed = _hasher.Hash(password);
        //    var newUser = new UserEntity
        //    {
        //        Username = username,
        //        PasswordHash = hashed,
        //        FailedLoginAttempts = 0,
        //        IsLocked = false,
        //        CreatedAt = DateTime.UtcNow
        //    };

        //    foreach (var roleName in roles)
        //    {
        //        var role = await _context.Roles.FirstAsync(r => r.Name == roleName, cancellationToken);
        //        newUser.UserRoles.Add(new UserRoleEntity
        //        {
        //            RoleId = role.Id,
        //            User = newUser,
        //            Role = role
        //        });
        //    }

        //    _context.Users.Add(newUser);
        //    await _context.SaveChangesAsync(cancellationToken);
        //}
    }
}
