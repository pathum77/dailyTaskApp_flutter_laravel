import 'package:http/http.dart' as http;

 class DeleteTask{
   void deleteData(int id) async {
    //final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key ) ?? 0;

    String myUrl = "http://192.168.214.43:8000/api/deletetask/$id";
    http.delete(Uri.parse(myUrl),
        headers: {
          'Accept':'application/json',
          //'Authorization' : 'Bearer $value'
    } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
 }