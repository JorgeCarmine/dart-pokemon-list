import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final urlbase = 'https://pokeapi.co/api/v2/pokemon?limit=100&offset=200';

void getHttp() async {
  try {
    var response = await Dio().get(urlbase);
    print(response);
  } catch (e) {
    print(e);
  }
}

void getHttpNew() async {
  try {
    var response = await http.get(Uri.parse(urlbase));
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    var list = jsonDecode(response.body);

    for (var item in list['results']) {
      print('${item['name'].toUpperCase()}');
    }
  } catch (e) {
    print(e);
  }
}

void main(List<String> arguments) {
  print('Hello world!');

  getHttpNew();
}
