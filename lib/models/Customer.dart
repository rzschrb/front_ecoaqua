import 'package:http/http.dart' as http;
class Customer {

  static String id = "false";

  static Future<String> login(String email,String password) async {
    final response = await http
        .post(Uri.parse('http://localhost:8080/influxIOT/signIn'),body: "{\"email\" : \"$email\",\"password\" : \"$password\"}");
    if (response.statusCode == 200) {
      print(response.body.toString());
      id = response.body.toString();
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return "false";
    }
  }
}