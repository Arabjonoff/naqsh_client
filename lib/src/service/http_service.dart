import 'dart:io';

import 'package:naqsh_client/src/service/base_service.dart';
import 'package:http/http.dart' as http;

class HttpService extends BaseService{
  dynamic responseJson;
  @override
  Future getResponse(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + url));
      print(response.statusCode);
      print(response.body);
    } on SocketException {
      throw Exception('Internet error');
    }
    return responseJson;
  }

}