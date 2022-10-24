import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    required this.d1,
    required this.d2,
    required this.d3,
    required this.d4,
    required this.name,
    required this.idT,
     this.jwt,
     this.message,
  });

  bool? status;
  int d1;
  int d2;
  int d3;
  int d4;
  String name;
  String idT;
  String? jwt;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"]??false,
    d1: json["D1"]??0,
    d2: json["D2"]??0,
    d3: json["D3"]??0,
    d4: json["D4"]??0,
    name: json["NAME"]??"",
    idT: json["ID_T"]??"",
    jwt: json["JWT"]??"",
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "D1": d1,
    "D2": d2,
    "D3": d3,
    "D4": d4,
    "NAME": name,
    "ID_T": idT,
  };
}
