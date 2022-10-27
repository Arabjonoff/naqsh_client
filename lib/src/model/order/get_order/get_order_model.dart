// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromJson(String str) => GetOrderModel.fromJson(json.decode(str));

class GetOrderModel {
  GetOrderModel({
    required this.result,
  });

  List<GetOrderResult> result;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
    result: json["data"] == null ?<GetOrderResult>[]:List<GetOrderResult>.from(json["data"].map((x) => GetOrderResult.fromJson(x))),
  );
}

class GetOrderResult {
  GetOrderResult({
    required this.id,
    required this.name,
    required this.idToch,
    required this.dt,
    required this.ndoc,
    required this.izoh,
    required this.st,
    required this.sm,
    required this.tzakaz1,
  });

  int id;
  String name;
  String idToch;
  DateTime dt;
  String ndoc;
  String izoh;
  int st;
  int sm;
  List<Tzakaz1> tzakaz1;

  factory GetOrderResult.fromJson(Map<String, dynamic> json) => GetOrderResult(
    id: json["ID"]??0,
    name: json["NAME"]??"",
    idToch: json["ID_TOCH"]??"",
    dt: DateTime.parse(json["DT"]),
    ndoc: json["NDOC"]??"",
    izoh: json["IZOH"]??"",
    st: json["ST"]??0,
    sm: json["SM"]??0,
    tzakaz1: List<Tzakaz1>.from(json["tzakaz1"].map((x) => Tzakaz1.fromJson(x))),
  );

}



class Tzakaz1 {
  Tzakaz1({
    required this.name,
    required this.idSkl2,
    required this.soni,
    required this.narhi,
    required this.sm,
  });

  String name;
  int idSkl2;
  int soni;
  int narhi;
  int sm;

  factory Tzakaz1.fromJson(Map<String, dynamic> json) => Tzakaz1(
    name: json["NAME"]??"",
    idSkl2: json["ID_SKL2"]??0,
    soni: json["SONI"]??0,
    narhi: json["NARHI"]??0,
    sm: json["SM"]??0,
  );

}
