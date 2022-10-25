import 'package:naqsh_client/src/model/category/category_model.dart';
import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CategoryBloc {
  final _repository = Repository();

  final fetchCategory = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get getCategories => fetchCategory.stream;

  getCategory() async {
    HttpResult result = await _repository.getCategory();
    if (result.isSuccess) {
      CategoryModel categoryModel = CategoryModel.fromJson(result.result);
      fetchCategory.sink.add(categoryModel);
    }
  }
}

final categoryBloc = CategoryBloc();
