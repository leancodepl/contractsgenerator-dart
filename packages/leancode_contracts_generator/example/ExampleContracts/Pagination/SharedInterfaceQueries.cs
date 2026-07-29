using LeanCode.Contracts;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // A non-DTO statement (here: a query) implementing a generic interface also
    // needs the `toJson` override, and gets it via `createBase` like any DTO.
    public interface IFacetQuery<TFacet>
    {
        TFacet Facet { get; set; }
    }

    // Query + one generic interface: arity-1 override.
    public class FacetQueryUser : IQuery<int?>, IFacetQuery<User>
    {
        public User Facet { get; set; }
    }

    // Query combining the shared interface with a 2-arity one: the override is
    // arity 2, so the shared interface doesn't force a single arity.
    public class FacetQueryCombined : IQuery<bool>, IFacetQuery<User>, IPairFacet<User, PaginatedResult<User>>
    {
        public User Facet { get; set; }
        public User Left { get; set; }
        public PaginatedResult<User> Right { get; set; }
    }
}
