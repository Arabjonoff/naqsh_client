import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/model/model_all/model_all.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoryDetailBloc {
  final _repository = Repository();

  final fetchCategoryDetail = PublishSubject<ModelAll>();
  GetCategoryDetailModel data = GetCategoryDetailModel.fromJson({});

  Stream<ModelAll> get categoryDetail =>
      fetchCategoryDetail.stream;

  ModelAll modelAll = ModelAll(
    categoryDetailModel: GetCategoryDetailModel.fromJson({}),
    loginModel: LoginModel.fromJson({}),
  );

  getCategoryDetail(int st, id) async {
    HttpResult result = await _repository.getCategoryDetail(st, id);
    if (result.isSuccess) {
      data = GetCategoryDetailModel.fromJson(result.result);
      convert();
    }


  }
convert()async{
  List<ProductResult> databaseCard = await _repository.getProductCart();
  for (int i = 0; i < databaseCard.length; i++) {
    if (data.data[i].count == databaseCard[i].id) {
      data.data[i].count = databaseCard[i].count;
    }
  }
  for (int i = 0; i < data.data.length; i++) {
    for (int j = 0; j < databaseCard.length; j++) {
      if (data.data[i].id == databaseCard[j].id) {
        data.data[i].count = databaseCard[j].count;
      }
    }
  }
  modelAll.categoryDetailModel = data;
  fetchCategoryDetail.sink.add(modelAll);
  List<LoginModel> dataBase = await _repository.getLogin();
  modelAll.loginModel = dataBase.first;
}
  updateCart(ProductResult detailResult, bool remove) async {
    if (remove) {
      detailResult.count--;
      if (detailResult.count == 0) {
        await _repository.deleteProductCard(detailResult.id);
      } else {
        await _repository.updateProduct(detailResult);
      }
    } else {
      detailResult.count++;
      if (detailResult.count == 1) {
        await _repository.saveProductCard(detailResult);
      } else {
        await _repository.updateProduct(detailResult);
      }
    }
  }
}

final categoryDetailBloc = CategoryDetailBloc();
