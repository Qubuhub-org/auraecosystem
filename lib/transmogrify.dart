library transmogrify;

export 'src/transmogrification.dart';
export 'src/transmogrifier.dart';

/// Extension method for fluid, inline transmogrification on any Dart object.
extension TransmogrifyExtension<T> on T {
  /// Transforms `this` into [R] using the provided [transformer] closure.
  R transmogrifyWith<R>(R Function(T input) transformer) {
    return transformer(this);
  }
}
