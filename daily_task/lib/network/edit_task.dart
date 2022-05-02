// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class EditTaskk {
  void editData(int id, String taskname, String description) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key ) ?? 0;

    String myUrl = "http://192.168.214.43:8000/api/edittask/$id";
    http.put(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      //'Authorization' : 'Bearer $value'
    }, body: {
      "taskname": taskname,
      "description": description
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
}
