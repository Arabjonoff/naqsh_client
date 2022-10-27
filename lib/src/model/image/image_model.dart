// To parse this JSON data, do
//
//     final getImageModel = getImageModelFromJson(jsonString);

import 'dart:convert';

GetImageModel getImageModelFromJson(String str) => GetImageModel.fromJson(json.decode(str));

class GetImageModel {
  GetImageModel({
    required this.data,
  });

  List<Datum> data;

  factory GetImageModel.fromJson(Map<String, dynamic> json) => GetImageModel(
    data: json["data"] == null?<Datum>[]:List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.idTip,
    required this.idFirma,
    required this.idEdiz,
    required this.photo,
    required this.vz,
    required this.msoni,
    required this.st,
  });

  int id;
  String name;
  int idTip;
  int idFirma;
  int idEdiz;
  String photo;
  dynamic vz;
  int msoni;
  int st;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"]??0,
    name: json["NAME"]??"",
    idTip: json["ID_TIP"]??0,
    idFirma: json["ID_FIRMA"]??0,
    idEdiz: json["ID_EDIZ"]??0,
    photo: json["PHOTO"]??"",
    vz: json["VZ"],
    msoni: json["MSONI"]??0,
    st: json["ST"]??0,
  );

}
