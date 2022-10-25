// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

MessageModel productsFromJson(String str) => MessageModel.fromJson(json.decode(str));

String productsToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.status,
    required this.message,
    required this.token,
  });

  bool status;
  dynamic message;
  dynamic token;

  factory MessageModel.fromJson(Map<dynamic, dynamic> json) => MessageModel(
    status: json["status"]??false,
    message: json["message"]??'',
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
  };
}
