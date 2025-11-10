using Cibergestion.Microservices.Nps.UseCase.Data;
using Cibergestion.Microservices.Nps.UseCase.Entities;
using Cibergestion.Microservices.Nps.UseCase.Nps.Repositories;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Cibergestion.Microservices.Nps.UseCase.NpsVote.CreateVote
{
    public class CreateVoteCommandHandler : IRequestHandler<CreateVoteRequest, Result>
    {
        private readonly IVoteRepository _voteRepository;

        public CreateVoteCommandHandler(IVoteRepository voteRepository)
        {
            _voteRepository = voteRepository;
        }


        public async  Task<Result> Handle(CreateVoteRequest request, CancellationToken cancellationToken)
        {
            if (request.Score < 0 || request.Score > 10)
            {
                return new Result
                {
                    Message = "Score must be between 0 and 10.",
                    Success = false
                };
            }

            if (await _voteRepository.UserHasVotedAsync(request.UserId, cancellationToken))
            {
                return new Result
                {
                    Message = "User has already submitted a vote.",
                    Success = false
                };
            }

            var vote = new VoteEntity
            {
                UserId = request.UserId,
                Score = request.Score
            };

            await _voteRepository.CreateAsync(vote, cancellationToken);

            return new Result
            {
                Message = "Vote submitted successfully.",
                Success = true
            };
        }
    }
}
