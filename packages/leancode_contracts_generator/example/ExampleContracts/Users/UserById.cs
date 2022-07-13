using LeanCode.Contracts;
using LeanCode.Contracts.Security;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class UserById : IQuery<UserInfoDTO?>
    { }
}
