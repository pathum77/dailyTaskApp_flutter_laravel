import 'dart:convert';
import 'package:http/http.dart' as http;

class ListDataa {
  String baseURL = 'http://192.168.214.43:8000/api/getlist';

  Future<List> getAllList() async {
    try {
      http.Response response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
