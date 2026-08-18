// test/fetch_album_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:my_app/main.dart'; // Adjust path to match your app

void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient((request) async {
        return http.Response(
          '{"userId": 1, "id": 1, "title": "quidem rerum facilis"}',
          200,
        );
      });

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient((request) async {
        return http.Response('Not Found', 444);
      });

      expect(fetchAlbum(client), throwsException);
    });
  });
}
