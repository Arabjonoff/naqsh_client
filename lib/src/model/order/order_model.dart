
import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  OrderModel({
    required this.id,
    required this.name,
    required this.ndoc,
    required this.idToch,
    required this.izoh,
    required this.dt,
    required this.sm,
    required this.tzakaz1,
  });

  int id;
  String name;
  String ndoc;
  String idToch;
  String izoh;
  String dt;
  int sm;
  List<Tzakaz1> tzakaz1;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["ID"]??0,
    name: json["NAME"]??'',
    ndoc: json["NDOC"]??'',
    idToch: json["ID_TOCH"]??'',
    izoh: json["IZOH"]??'',
    dt: json["DT"]??'',
    sm: json["SM"]??0,
    tzakaz1: json["TZAKAZ1"] == null ?<Tzakaz1>[]:List<Tzakaz1>.from(json["TZAKAZ1"].map((x) => Tzakaz1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NAME": name,
    "NDOC": ndoc,
    "ID_TOCH": idToch,
    "IZOH": izoh,
    "DT": dt,
    "SM": sm,
    "TZAKAZ1": List<dynamic>.from(tzakaz1.map((x) => x.toJson())),
  };
}

class Tzakaz1 {
  Tzakaz1({
    required this.name,
    required this.idSkl2,
    required this.soni,
    required this.narhi,
    required this.snarh,
    required this.sm,
  });

  String name;
  dynamic idSkl2;
  dynamic soni;
  dynamic narhi;
  dynamic snarh;
  dynamic sm;

  factory Tzakaz1.fromJson(Map<String, dynamic> json) => Tzakaz1(
    name: json["NAME"]??'',
    idSkl2: json["ID_SKL2"]??0,
    soni: json["SONI"]??0,
    narhi: json["NARHI"]??0,
    snarh: json["SNARH"]??0,
    sm: json["SM"]??0,
  );

  Map<String, dynamic> toJson() => {
    "NAME": name,
    "ID_SKL2": idSkl2,
    "SONI": soni,
    "NARHI": narhi,
    "SNARH": snarh,
    "SM": sm,
  };
}