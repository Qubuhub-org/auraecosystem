import 'transmogrification.dart';

/// The main engine responsible for managing and applying transformation rules.
class Transmogrifier {
  final Map<Type, Map<Type, Function>> _rules = {};

  /// Registers a transformation function from [From] to [To].
  void register<From, To>(To Function(From input) transformer) {
    _rules.putIfAbsent(From, () => {})[To] = transformer;
  }

  /// Registers a full [Transmogrification] instance.
  void registerRule<From, To>(Transmogrification<From, To> rule) {
    register<From, To>(rule.transform);
  }

  /// Converts [input] from [From] to [To] using a registered rule.
  To convert<From, To>(From input) {
    final targetMap = _rules[From];
    if (targetMap == null || !targetMap.containsKey(To)) {
      throw StateError('No transmogrification rule registered from $From to $To.');
    }
    return (targetMap[To]! as Function)(input) as To;
  }

  /// Checks if a conversion path exists between [From] and [To].
  bool canTransmogrify<From, To>() {
    return _rules[From]?.containsKey(To) ?? false;
  }
}
