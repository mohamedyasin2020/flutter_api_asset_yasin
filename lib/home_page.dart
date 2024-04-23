import 'dart:convert';
import 'package:flutter_api_yasin/model_page.dart';
import 'package:http/http.dart' as http;

class Lessonserver {
 /* static Future<List<Details>> fetchLessons() async {
    print('Reading from asset');
    final String response = await rootBundle.loadString('assets/file.json');

    if (response != null) {
      List<dynamic> jsonResponse = jsonDecode(response);
      List<Details> lessons = jsonResponse
          .map((data) => Details.fromJson(data as Map<String, dynamic>))
          .toList();
      print('$lessons');
      return lessons;
    } else {
      throw Exception('Failed to load lessons');
    }
  }*/
static Future<List<Details>> fetchLessons() async {
  print("Reading from URL");
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  if (response.statusCode == 200) {
  List<dynamic> jsonResponse = jsonDecode(response.body);
  print(response.body);

  // Mapping the JSON response to a list of PersonDetails
  List<Details> lessons = jsonResponse.map<Details>((data) =>
  Details.fromJson(data)).toList();

  return lessons;
  } else {
  throw Exception('Failed to load lessons');
  }
  }
}
