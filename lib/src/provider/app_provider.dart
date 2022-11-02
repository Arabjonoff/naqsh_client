import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/http/http_model.dart';
import 'package:http/http.dart' as http;

import '../model/order/order_model.dart';

Duration durationTimeout = const Duration(seconds: 30);

class AppProvider {
  final String baseUrl = 'https://naqshsoft.site/';

  Future<HttpResult> _getRequest(String url) async {
    try {
      http.Response response = await http
          .get(
            Uri.parse(
              url,
            ),
          )
          .timeout(
            durationTimeout,
          );
      print(url);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        statusCode: -1,
        result: "Network",
      );
    }
  }

  Future<HttpResult> _postRequest(String url, body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(body);
    return _result(response);
  }

  HttpResult _result(http.Response response) {
    print(response.body);
    print(response.statusCode);
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

  Future<HttpResult> getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var db = prefs.getString('db');
    String url = '${baseUrl}tip?DB=$db';
    return await _getRequest(url);
  }

  Future<HttpResult> getUsd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var db = prefs.getString('db');
    String url = '${baseUrl}getkurs?DB=$db';
    return await _getRequest(url);
  }

  Future<HttpResult> getCategoryDetail(int st, id) async {
    var now = DateTime.now();
    var years = DateFormat('yyyy');
    var months = DateFormat('MM');
    String year = years.format(now);
    String month = months.format(now);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var db = prefs.getString('db');
    String url =
        '${baseUrl}sklad01?DB=$db&YIL=$year&OY=$month&ID_SKL0=$st&ID_TIP=$id';
    return await _getRequest(url);
  }

  Future<HttpResult> orderProducts(List<OrderModel> order) async {
    DateTime dateTime = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String db = prefs.getString('db') ?? '';
    String url = 'https://naqshsoft.site/tzakaz?DB=$db';
    return await _postRequest(url, json.encode(order));
  }

  Future<HttpResult> getOrderProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String db = prefs.getString('db') ?? '';
    String url = 'https://naqshsoft.site/tzakaz?DB=$db';
    return await _getRequest(
      url,
    );
  }
}
