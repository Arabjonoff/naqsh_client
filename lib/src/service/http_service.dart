import 'dart:convert';
import 'dart:io';

import '../model/http/http_model.dart';
import 'package:http/http.dart' as http;
class HttpService{
  final String baseUrl = 'https://naqshsoft.site/';

  Future getRequest(String url) async{
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + url));
      print(url);
      print(response.body);
      return result(response);
    } on SocketException {
      throw Exception('Internet error');
    }
  }

  HttpResult result(http.Response response) {
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResult(
        isSuccess: true,
        statusCode: response.statusCode,
        result: json.decode(response.body),
      );
    } else {
      return HttpResult(
        isSuccess: false,
        statusCode: response.statusCode,
        result: response.body,
      );
    }
  }
}