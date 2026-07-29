namespace LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination
{
    // Generic implementers that forward their own type variable across several
    // generic bases: the single `toJson` must override every base and pass the
    // child's factory to `_$...ToJson`. Interfaces reused from
    // MultiGenericInterface.cs.

    // `T` is at position 0 in IFirstFacet, position 1 in IPairFacet. It is
    // forwarded from position 1 (where every base agrees on `T`); position 0
    // clashes with the concrete `User`, so it is an unused `Never` slot.
    public class ForwardedAtSecondPosition<T> : IFirstFacet<T>, IPairFacet<User, T>
    {
        public T First { get; set; }
        public User Left { get; set; }
        public T Right { get; set; }
    }

    // `T` clashes with a concrete `User` at position 0, so no position forwards
    // it: position 0 is a `Never` slot and `T` is appended as an extra parameter.
    public class ForwardedVarWithConcreteClash<T> : IFirstFacet<T>, ISecondFacet<User>
    {
        public T First { get; set; }
        public User Second { get; set; }
    }

    // Two variables clashing at position 0: it becomes `Never` and both are
    // appended as extra parameters.
    public class TwoForwardedVars<A, B> : IFirstFacet<A>, ISecondFacet<B>
    {
        public A First { get; set; }
        public B Second { get; set; }
    }

    // `T` bound at both positions of one base. It is forwarded from position 0;
    // position 1 must be an unused `Never` slot, otherwise the override would
    // emit two parameters named `toJsonT`.
    public class VarBoundTwice<T> : IPairFacet<T, T>
    {
        public T Left { get; set; }
        public T Right { get; set; }
    }
}
