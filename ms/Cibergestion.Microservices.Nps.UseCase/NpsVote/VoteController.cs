using Cibergestion.Microservices.Nps.UseCase.NpsVote.CreateVote;
using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetNps;
using Cibergestion.Microservices.Nps.UseCase.NpsVote.GetVotes;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Cibergestion.Microservices.Nps.UseCase.Nps
{
    [ApiController]
    [Route("api/[controller]")]
    public class VoteController : ControllerBase
    {

        private readonly IMediator _mediator;

        public VoteController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost]
        [Authorize(Roles = "Voter")]
        public async Task<IActionResult> Vote([FromBody] int voter)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
            if (userIdClaim == null)
                return StatusCode(StatusCodes.Status401Unauthorized, new { message = "dont exist user" });

            var request = new CreateVoteRequest()
            {
                UserId = int.Parse(userIdClaim.Value),
                Score = (byte)voter
            };

            var result = await _mediator.Send(request);
            if (!result.Success)
                return BadRequest(new { message = result.Message });

            return Ok(new { message = result.Message });

        }

        [HttpGet("all")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GeAllVotes()
        {
            var result = await _mediator.Send(new GetVotesQuery());
            return Ok(result);
        }

        [HttpGet("calculate-nps")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GeNpsVotes()
        {
            var result = await _mediator.Send(new GetNpsQuery());
            return Ok(result);
        }
    }
}
