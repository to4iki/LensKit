public struct Lens<S, T> {
    public let _get: (S) -> T
    public let _set: (S, T) -> S
    
    public init(get: @escaping (S) -> T, set: @escaping (S, T) -> S) {
        self._get = get
        self._set = set
    }
    
    public func get(_ source: S) -> T {
        return _get(source)
    }
    
    public func set(_ source: S, value: T) -> S {
        return _set(source, value)
    }
}

// MARK: - Derived
extension Lens {
    public func modify(_ source: S, transform: (T) throws -> T) rethrows -> S {
        return set(source, value: try transform(get(source)))
    }
    
    public func compose<U>(_ other: Lens<T, U>) -> Lens<S, U> {
        return Lens<S, U>(
            get: { (source: S) -> U in
                other.get(self.get((source)))
            },
            set: { (source: S, value: U) -> S in
                self.set(source, value: other.set(self.get(source), value: value))
            }
        )
    }
}

// MARK: - Operators
public func >>> <S, T, U>(lhs: Lens<S, T>, rhs: Lens<T, U>) -> Lens<S, U> {
    return lhs.compose(rhs)
}
