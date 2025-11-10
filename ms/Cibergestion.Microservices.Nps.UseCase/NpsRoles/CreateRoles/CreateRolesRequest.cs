using MediatR;

namespace Cibergestion.Microservices.Nps.UseCase.NpsRoles.CreateRoles
{
    public record CreateRolesRequest : IRequest<Unit>
    {
        public bool IncludeDefaultUsers { get; set; } = false;
    }
}
