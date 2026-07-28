using System.Collections.Generic;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // Regression fixture for https://github.com/leancodepl/contractsgenerator-dart/issues/95
    //
    // A non-generic DTO that has a field typed as a concretely-instantiated generic
    // DTO must be serializable. Previously the generator stripped `toJson` from every
    // generic DTO, so `build_runner` failed with "Could not generate `toJson` code"
    // for such fields. This fixture exercises:
    //   * a generic DTO used as a concrete field (`PaginatedResult<User>`),
    //   * a concrete DTO extending a generic DTO (`AllUsersResult`),
    //   * a generic DTO extending a generic DTO (`ChildResult<T>`).
    //
    // `PaginatedResult<TResult>` is defined in ../PaginatedQuery.cs and reused here.
    public class User
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    public class AllUsersResult : PaginatedResult<User>
    { }

    public class ChildResult<T> : PaginatedResult<T>
    {
        public List<T> Extras { get; set; }
    }

    public class SearchResponse
    {
        public PaginatedResult<User> Page { get; set; }
        public AllUsersResult AllUsers { get; set; }
        public ChildResult<User> Children { get; set; }
    }
}
