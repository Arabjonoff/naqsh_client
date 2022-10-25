import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../repository/repository.dart';

class CartBloc{
  final Repository _repository = Repository();

  final _fetCart = PublishSubject<List<ProductResult>>();

  Stream<List<ProductResult>> get getCard => _fetCart.stream;

  allCart() async {
    List<ProductResult> dataCart = await _repository.getProductCart();
    _fetCart.sink.add(dataCart);
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
  deleteProductCard(int id) async {
    int k = await _repository.deleteProductCard(id);
    if (k > 0) {
      allCart();
    }
  }
}
final cartBloc = CartBloc();