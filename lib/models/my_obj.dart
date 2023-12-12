import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map> objJson() async {
  var url = Uri.https('api.hgbrasil.com', 'finance', {'key': '4c8710ae'});
  var response = await http.get(url);
  return jsonDecode(response.body);
}
