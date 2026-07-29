namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // A concrete DTO implementing several generic interfaces at once (C# allows
    // only one base class). Each interface generates a factory-taking `toJson`,
    // and the single `toJson` on the implementer must override all of them.
    // `PaginatedResult<TResult>`/`User` are reused from the sibling examples.
    public interface IFirstFacet<TFirst>
    {
        TFirst First { get; set; }
    }

    public interface ISecondFacet<TSecond>
    {
        TSecond Second { get; set; }
    }

    public interface IPairFacet<TLeft, TRight>
    {
        TLeft Left { get; set; }
        TRight Right { get; set; }
    }

    // Two arity-1 interfaces binding the same type at position 0.
    public class SameFacets : IFirstFacet<User>, ISecondFacet<User>
    {
        public User First { get; set; }
        public User Second { get; set; }
    }

    // Interfaces binding different types at position 0: this is what forces the
    // unused slot to be `Object? Function(Never)?` — no single concrete type
    // could override both.
    public class MixedFacets : IFirstFacet<User>, ISecondFacet<PaginatedResult<User>>
    {
        public User First { get; set; }
        public PaginatedResult<User> Second { get; set; }
    }

    // Bases of different arity: the override widens to the largest (2).
    public class DifferentArityFacets : IFirstFacet<User>, IPairFacet<User, PaginatedResult<User>>
    {
        public User First { get; set; }
        public User Left { get; set; }
        public PaginatedResult<User> Right { get; set; }
    }

    // Different arity and different types at position 0 (the arity-2 `Never` case).
    public class ClashingArityFacets : IFirstFacet<User>, IPairFacet<PaginatedResult<User>, User>
    {
        public User First { get; set; }
        public PaginatedResult<User> Left { get; set; }
        public User Right { get; set; }
    }
}
