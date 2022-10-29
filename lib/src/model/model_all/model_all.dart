import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';

class ModelAll{
   GetCategoryDetailModel categoryDetailModel;
   LoginModel loginModel;

  ModelAll({
    required this.categoryDetailModel,
    required this.loginModel,
});
}