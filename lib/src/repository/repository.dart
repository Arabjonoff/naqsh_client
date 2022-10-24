import 'package:naqsh_client/src/database_helper/database_helper.dart';
import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/provider/app_provider.dart';

import '../model/http/http_model.dart';

class Repository{
  final _provider = AppProvider();
  final _dataBaseLogin = DataBaseLogin();

  Future<List<LoginModel>> getLogin() => _dataBaseLogin.getLogin();
  Future<HttpResult> login(String db,number,password) => _provider.login(db, number, password);
  Future<HttpResult> getProducts() => _provider.getProducts();
  Future<int> saveLogin(LoginModel item) => _dataBaseLogin.saveLogin(item);

}