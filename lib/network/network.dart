import 'package:parkapp/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String baseUrl = "https://www.google.com/";

class Network{
  static Future<String> xacThuc(User user)async{
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://www.googleapis.com/books/v1/volumes?q=vietnam';

    // Await the http get response, then decode the json-formatted response.
//    var response = await http.get(url);
//    if (response.statusCode == 200) {
//      var jsonResponse = convert.jsonDecode(response.body);
//      var itemCount = jsonResponse['totalItems'];
//      print('Number of books about http: $itemCount.');
//    } else {
//      print('Request failed with status: ${response.statusCode}.');
//    }
  return "USER";
  }
}