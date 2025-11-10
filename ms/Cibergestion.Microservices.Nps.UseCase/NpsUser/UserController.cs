using Cibergestion.Microservices.Nps.UseCase.NpsUser.CreateUser;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.GetUser;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UserController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost]
        public async Task<IActionResult> CreateUser([FromBody] CreateUserRequest request, CancellationToken cancellationToken)
        {
            var userId = await _mediator.Send(request, cancellationToken);

            return CreatedAtAction(nameof(GetUserById), new { id = userId }, new { Id = userId });
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUserById(int id, CancellationToken cancellationToken)
        {
            var users = await _mediator.Send(new GetAllUsersQuery(), cancellationToken);
            var user = users.FirstOrDefault(u => u.Id == id);
            if (user == null)
                return NotFound($"No se encontró el usuario con ID {id}.");

            return Ok(new
            {
                user.Id,
                user.Username,
                Roles = user.UserRoles.Select(r => r.Role.Name),
                user.IsLocked,
                user.CreatedAt
            });
        }
    }
}
