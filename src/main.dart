import 'package:http/http.dart' as http;

var url = Uri.https('dartpad.dev', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('dartpad.dev', 'foobar.txt')));
