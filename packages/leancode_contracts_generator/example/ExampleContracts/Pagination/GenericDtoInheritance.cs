using System.Collections.Generic;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // Serialization of generic DTOs and of DTOs that inherit from them. Exercises:
    //   * a generic DTO used as a concrete field (`PaginatedResult<User>`),
    //   * a concrete DTO extending a generic DTO (`AllUsersResult`),
    //   * a generic DTO extending a generic DTO (`ChildResult<T>`).
    //
    // It additionally exercises the follow-up self-containment case: a generic DTO
    // whose base is instantiated with a *wrapped* type parameter
    // (`GenericSub<TItem> : GenericBase<GenericWrapper<TItem>>`), used both directly
    // and inside a `List<>` on a non-generic holder (`LeafHolder`). Because the
    // subclass `toJson` override is zero-arg-callable, json_serializable emitted
    // such fields without threading the generic-argument factories, leaving live
    // Dart objects (including the innermost leaf items inside the wrapper) in the
    // map. `toJson()` on such a holder must instead be self-contained -- only
    // maps/lists/primitives at every depth.
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

    // Follow-up self-containment case: a generic subclass whose base is
    // instantiated with a wrapped type parameter.
    public class GenericBase<T>
    {
        public T Slot { get; set; }
        public List<T> Items { get; set; }
    }

    public class GenericWrapper<TItem>
    {
        public List<TItem> Items { get; set; }
        public int Points { get; set; }
    }

    public class GenericSub<TItem> : GenericBase<GenericWrapper<TItem>>
    {
        public GenericWrapper<TItem> Detail { get; set; }
    }

    public class Leaf
    {
        public string Id { get; set; }
    }

    public class LeafHolder
    {
        public List<GenericSub<Leaf>> Entries { get; set; }
        public GenericSub<Leaf> Single { get; set; }
    }
}
