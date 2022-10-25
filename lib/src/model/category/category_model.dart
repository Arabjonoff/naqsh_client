
class CategoryModel {
  CategoryModel({
    required this.status,
    required this.result,
  });

  bool status;
  List<CategoryResult> result;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"]?? false,
    result: List<CategoryResult>.from(json["data"].map((x) => CategoryResult.fromJson(x))),
  );
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.name,
    required this.st,
  });

  int id;
  String name;
  int st;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
    id: json["ID"]??0,
    name: json["NAME"]??"",
    st: json["ST"]??0,
  );

}
