using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Repositories;
using Cibergestion.Microservices.Nps.UseCase.NpsRoles.Services;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Repositories;
using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.CreateUser
{
    public class CreateUserCommandHandler : IRequestHandler<CreateUserRequest, int>
    {
        private readonly IUserRepository _userRepository;
        private readonly IRoleRepository _roleRepository;
        private readonly IPasswordHasher _hasher;

        public CreateUserCommandHandler(IUserRepository userRepository, IRoleRepository roleRepository, IPasswordHasher hasher)
        {
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _hasher = hasher;
        }
        public async Task<int> Handle(CreateUserRequest request, CancellationToken cancellationToken)
        {
            var exists = await _userRepository.ExistsAsync(request.Username, cancellationToken);
            if (exists) throw new InvalidOperationException("El usuario ya existe.");

            var role = await _roleRepository.GetByNameAsync(request.Role, cancellationToken);
            if (role == null) throw new InvalidOperationException($"El rol {request.Role} no existe.");

            var user = new UserEntity
            {
                Username = request.Username,
                PasswordHash = _hasher.Hash(request.Password),
                IsLocked = false,
                CreatedAt = DateTime.UtcNow,
                UserRoles = new List<UserRoleEntity>
                {
                    new UserRoleEntity { RoleId = role.Id }
                }
            };


            return await _userRepository.CreateAsync(user, cancellationToken);
        }
    }
}
