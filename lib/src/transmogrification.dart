/// Represents a single, reusable transformation rule from [From] to [To].
abstract class Transmogrification<From, To> {
  const Transmogrification();

  /// Executes the conversion.
  To transform(From input);
}

/// Functional implementation of [Transmogrification].
class FunctionalTransmogrification<From, To> extends Transmogrification<From, To> {
  final To Function(From input) _transform;

  const FunctionalTransmogrification(this._transform);

  @override
  To transform(From input) => _transform(input);
}
