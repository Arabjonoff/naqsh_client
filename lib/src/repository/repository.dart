import 'package:naqsh_client/src/database_helper/database_helper.dart';
import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/order/order_model.dart';
import 'package:naqsh_client/src/provider/app_provider.dart';

import '../model/http/http_model.dart';

class Repository {
  final _provider = AppProvider();
  final _dataBaseLogin = DataBaseLogin();

  Future<int> saveProductCard(ProductResult data) => _dataBaseLogin.saveProduct(data);

  Future<List<ProductResult>> getProductCart() => _dataBaseLogin.getProduct();

  Future<int> updateProduct(ProductResult products) => _dataBaseLogin.updateProduct(products);

  Future<int> deleteProductCard(int data) => _dataBaseLogin.deleteProductCard(data);

  Future<List<LoginModel>> getLogin() => _dataBaseLogin.getLogin();

  Future<HttpResult> login(String db, number, password) => _provider.login(db, number, password);

  Future<HttpResult> getCategory() => _provider.getCategory();

  Future<HttpResult> getUsd() => _provider.getUsd();

  Future<HttpResult> getCategoryDetail(int st,id) => _provider.getCategoryDetail(st, id);

  Future<int> saveLogin(LoginModel item) => _dataBaseLogin.saveLogin(item);

  Future clear() => _dataBaseLogin.clear();

  Future clearCart() => _dataBaseLogin.clearCart();

  Future orderProducts(List<OrderModel> order) => _provider.orderProducts(order);

  Future getOrderProducts( ) => _provider.getOrderProducts();

}
