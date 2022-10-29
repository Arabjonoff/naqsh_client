import 'dart:convert';

GetCategoryDetailModel getCategoryDetailModelFromJson(String str) =>
    GetCategoryDetailModel.fromJson(json.decode(str));

String getCategoryDetailModelToJson(GetCategoryDetailModel data) =>
    json.encode(data.toJson());

class GetCategoryDetailModel {
  GetCategoryDetailModel({
    required this.data,
  });

  List<ProductResult> data;

  factory GetCategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryDetailModel(
        data: json["data"] == null
            ? <ProductResult>[]
            : List<ProductResult>.from(
                json["data"].map((x) => ProductResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductResult {
  ProductResult({
    required this.id,
    required this.name,
    required this.idSkl2,
    required this.idTip,
    required this.narhi,
    required this.narhiS,
    required this.snarhi,
    required this.snarhiS,
    required this.osoni,
    required this.yil,
    required this.oy,
    required this.idSkl0,
    this.count = 0,
  });

  int id;
  String name;
  dynamic idSkl2;
  dynamic idTip;
  dynamic narhi;
  dynamic narhiS;
  dynamic snarhi;
  int snarhiS;
  dynamic osoni;
  String yil;
  String oy;
  dynamic idSkl0;
  int count;

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
        id: json["ID"] ?? 0,
        name: json["NAME"] ?? "",
        idSkl2: json["ID_SKL2"] ?? 0,
        idTip: json["ID_TIP"] ?? 0,
        narhi: json["NARHI"] ?? 0,
        narhiS: json["NARHI_S"] ?? 0,
        snarhi: json["SNARHI"] ?? 0,
        snarhiS: json["SNARHI_S"] ?? 0,
        osoni: json["OSONI"].toDouble() ?? 0.0,
        yil: json["YIL"] ?? "",
        oy: json["OY"] ?? "",
        idSkl0: json["ID_SKL0"] ?? 0,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "ID_SKL2": idSkl2,
        "ID_TIP": idTip,
        "NARHI": narhi,
        "NARHI_S": narhiS,
        "SNARHI": snarhi,
        "SNARHI_S": snarhiS,
        "OSONI": osoni,
        "YIL": yil,
        "OY": oy,
        "ID_SKL0": idSkl0,
        "count": count,
      };
}
