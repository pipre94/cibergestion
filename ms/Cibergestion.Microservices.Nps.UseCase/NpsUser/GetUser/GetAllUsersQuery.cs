using Cibergestion.Microservices.Nps.UseCase.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cibergestion.Microservices.Nps.UseCase.NpsUser.GetUser
{
    public record GetAllUsersQuery() : IRequest<IEnumerable<UserEntity>>;
}
