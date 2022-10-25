import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CategoryDetailBloc {
  final _repository = Repository();

  final fetchCategoryDetail = PublishSubject<GetCategoryDetailModel>();
  GetCategoryDetailModel data = GetCategoryDetailModel.fromJson({});

  Stream<GetCategoryDetailModel> get categoryDetail =>
      fetchCategoryDetail.stream;

  getCategoryDetail(int st, id) async {
    HttpResult result = await _repository.getCategoryDetail(st, id);
    List<ProductResult> databaseCard = await _repository.getProductCart();
    if (result.isSuccess) {
      data = GetCategoryDetailModel.fromJson(result.result);
      for (int i = 0; i < data.data.length; i++) {
        for (int j = 0; j < databaseCard.length; j++) {
          if (data.data[i].id == databaseCard[j].id) {
            data.data[i].count = databaseCard[j].count;
          }
        }
      }
      fetchCategoryDetail.sink.add(data);
    }
  }
  updateCart(ProductResult detailResult ,bool remove)async{
    if(remove){
      detailResult.count--;
      if(detailResult.count == 0){
        await _repository.deleteProductCard(detailResult.id);
      }
      else{
        await _repository.updateProduct(detailResult);
      }
    }
    else{
      detailResult.count++;
      if(detailResult.count == 1){
        await _repository.saveProductCard(detailResult);
      }
      else{
        await _repository.updateProduct(detailResult);
      }
    }
  }
}
final categoryDetailBloc = CategoryDetailBloc();
