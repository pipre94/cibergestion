using Cibergestion.Microservices.Nps.UseCase.Auth.Logout;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Auth;
using Cibergestion.Microservices.Nps.UseCase.NpsUser.Token;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Cibergestion.Microservices.Nps.UseCase.Auth
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;

        public AuthController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] AuthenticateUserRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var result = await _mediator.Send(request, cancellationToken);
                return Ok(result);
            }
            catch (UnauthorizedAccessException ex)
            {
                return StatusCode(StatusCodes.Status401Unauthorized, new { message = ex.Message });


            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al autenticar: {ex.Message}" });
            }
        }

        
        [HttpPost("refresh-token")]
        [AllowAnonymous]
        public async Task<IActionResult> RefreshToken([FromBody] RefreshTokenRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var accessToken = await _mediator.Send(request, cancellationToken);
                return Ok(new { AccessToken = accessToken });
            }
            catch (UnauthorizedAccessException ex)
            {
                return StatusCode(StatusCodes.Status401Unauthorized, new { message = ex.Message });

            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al refrescar el token: {ex.Message}" });
            }
        }

        [HttpPost("logout")]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Logout([FromBody] LogoutRequest request, CancellationToken cancellationToken)
        {
            try
            {
                await _mediator.Send(request, cancellationToken);
                return Ok(new { message = "Sesión cerrada correctamente." });
            }
            catch (UnauthorizedAccessException ex)
            {
                return StatusCode(StatusCodes.Status401Unauthorized, new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al cerrar sesión: {ex.Message}" });
            }
        }
    }
}
