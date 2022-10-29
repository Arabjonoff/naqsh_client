import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naqsh_client/src/model/order/get_order/get_order_model.dart';

import '../../../../bloc/order/get_order_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  initState(){
    getOrderBloc.getOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('orders'.tr()),
      ),
      body: SafeArea(
        child: StreamBuilder<GetOrderModel>(
          stream: getOrderBloc.getCategories,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              GetOrderModel data = snapshot.data!;
              return ListView.builder(
                itemCount: data.result.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.result[index].name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('date'.tr(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),), Text(DateFormat('dd.MM.yyyy').format(data.result[index].dt),style: const TextStyle(fontSize: 15),),
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text('count'.tr(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            Text(data.result[index].tzakaz1.map((e) => e.soni).toString()),
                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('product_name'.tr(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Expanded(
                                child: Text(data.result[index].tzakaz1.map((e) => e.name).toString(),textAlign: TextAlign.right,),
                              )
                            ],),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
        ),
      ),
    );
  }
}
