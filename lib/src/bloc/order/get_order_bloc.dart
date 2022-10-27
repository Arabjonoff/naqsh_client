import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/model/order/get_order/get_order_model.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetOrderBloc {
  final Repository _repository = Repository();
  GetOrderModel data = GetOrderModel.fromJson({});
  final _fetchOrder = PublishSubject<GetOrderModel>();
  Stream<GetOrderModel> get getCategories => _fetchOrder.stream;


  getOrder() async {
    HttpResult response = await _repository.getOrderProducts();
    if (response.isSuccess) {
      data = GetOrderModel.fromJson(response.result);
      _fetchOrder.sink.add(data);
    }
  }
}
final getOrderBloc = GetOrderBloc();