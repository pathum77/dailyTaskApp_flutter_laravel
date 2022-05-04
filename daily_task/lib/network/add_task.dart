// ignore_for_file: avoid_print

//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddTaskk {
  void addData(
      String taskname, String description, String startdate, enddate) async {
    ////final prefs = await SharedPreferences.getInstance();
    //// final key = 'token';
    //// final value = prefs.get(key ) ?? 0;

    String myUrl = 'http://192.168.214.43:8000/api/addtask';
    await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      //'Authorization' : 'Bearer $value'
    }, body: {
      "taskname": taskname,
      "description": description,
      "startdate": startdate,
      "enddate": enddate
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
}
