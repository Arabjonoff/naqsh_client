import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CategoryDetailBloc {
  final _repository = Repository();

  final fetchCategoryDetail = PublishSubject<GetCategoryDetailModel>();

  Stream<GetCategoryDetailModel> get categoryDetail =>
      fetchCategoryDetail.stream;

  getCategoryDetail(int st, id) async {
    HttpResult result = await _repository.getCategoryDetail(st, id);
    if (result.isSuccess) {
      GetCategoryDetailModel getCategoryDetailModel =
          GetCategoryDetailModel.fromJson(result.result);
      fetchCategoryDetail.sink.add(getCategoryDetailModel);
    }
  }
}
final categoryDetailBloc = CategoryDetailBloc();
