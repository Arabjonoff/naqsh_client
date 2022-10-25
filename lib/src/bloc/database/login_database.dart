import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/repository.dart';

class DatabaseLogin{
  final Repository _repository = Repository();

  final _fetchLogin = PublishSubject<List<LoginModel>>();

  Stream<List<LoginModel>> get getUser => _fetchLogin.stream;

  getLoginDatabase()async{
    List<LoginModel> data = await _repository.getLogin();
    _fetchLogin.sink.add(data);
  }
}

final dataBase = DatabaseLogin();