import 'package:test/test.dart';
import 'package:transmogrify/transmogrify.dart';

void main() {
  group('Transmogrifier Engine Tests', () {
    late Transmogrifier engine;

    setUp(() {
      engine = Transmogrifier();
    });

    test('transforms String to int correctly', () {
      engine.register<String, int>((input) => int.parse(input));
      expect(engine.convert<String, int>('42'), equals(42));
    });

    test('extension method transmogrifyWith transforms inline', () {
      final result = 'hello'.transmogrifyWith((s) => s.toUpperCase());
      expect(result, equals('HELLO'));
    });
  });
}
