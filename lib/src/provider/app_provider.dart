import 'dart:convert';
import 'dart:io';

import 'package:naqsh_client/src/service/http_service.dart';
import '../model/http/http_model.dart';
import 'package:http/http.dart' as http;

class AppProvider {
  final String baseUrl = 'https://naqshsoft.site/';

  Future<HttpResult> _getRequest(String url) async {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      print(url);
      return _result(response);
  }
  HttpResult _result(http.Response response) {
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

  Future<HttpResult> login(String db, number, password) async {
    String url = '${baseUrl}login_tr3?DB=$db&username=$number&pass=$password&';
    return await _getRequest(url);
  }

  Future<HttpResult> getProducts() async {
    String url = '${baseUrl}tip?DB=002';
    return await _getRequest(url);
  }
}
