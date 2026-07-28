using System.Collections.Generic;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // Serialization of generic DTOs and of DTOs that inherit from them. Exercises:
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
