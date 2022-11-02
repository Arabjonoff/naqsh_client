import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/bloc/cart/cart_bloc.dart';
import 'package:naqsh_client/src/dialog/error_dialog/error_dialog.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/widget/button/ontap_widget.dart';
import 'package:naqsh_client/src/widget/image/image_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/category/category_detail/category_detail_bloc.dart';
import '../../../model/http/http_model.dart';
import '../../../model/message/message_model.dart';
import '../../../model/order/order_model.dart';
import '../../../repository/repository.dart';
import 'package:http/http.dart'as http;

class CartScreen extends StatefulWidget {

  const CartScreen({Key? key,}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  initState() {
    super.initState();
    cartBloc.allCart();
    usd();
  }

  @override
  Widget build(BuildContext context) {
    final Repository _repository = Repository();
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'.tr()),
      ),
      body: SafeArea(
        child: StreamBuilder<List<ProductResult>>(
            stream: cartBloc.getCard,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                double price = 0;
                for (int i = 0; i < snapshot.data!.length; i++) {
                  price += (snapshot.data![i].snarhiS == 0
                      ? snapshot.data![i].snarhi * snapshot.data![i].count
                      : (snapshot.data![i].snarhiS * curs) * snapshot.data![i].count);
                }
                return data.isEmpty
                    ? Center(
                        child: Text('empty'.tr()),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          child: SizedBox(
                                              width: 60,
                                              child: ImageWidget(
                                                  id: data[index].idSkl2))),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data[index].name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        cartBloc
                                                            .deleteProductCard(
                                                                data[index].id);
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.redAccent,
                                                    ))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                data[index].snarhiS == 0
                                                    ? Text(
                                                        '${data[index]
                                                            .snarhi} ${'sum'.tr()}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18))
                                                    : Text(
                                                    '${data[index]
                                                        .snarhiS * curs} ${'sum'.tr()}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18)),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                    right: 16,
                                                  ),
                                                  width: 120,
                                                  child: Row(
                                                    children: [
                                                      data[index].count == 1
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color(
                                                                    0xFF5F6DF8),
                                                              ),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 1),
                                                              child: const Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )
                                                          : GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  cartBloc.updateCart(
                                                                      data[
                                                                          index],
                                                                      true);
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: const Color(
                                                                      0xFF5F6DF8),
                                                                ),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5,
                                                                    vertical:
                                                                        1),
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                      Expanded(
                                                          child: Center(
                                                              child: Text(
                                                        data[index]
                                                            .count
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ))),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            cartBloc.updateCart(
                                                                data[index],
                                                                false);
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 1),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: const Color(
                                                                0xFF5F6DF8),
                                                          ),
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5F6DF8),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'product_count'.tr(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text("${data.length} ${'count'.tr()}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'all_price'.tr(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text("${price.toInt()} ${'sum'.tr()}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          OnTapWidget(
                              onTap: () async {
                                SharedPreferences pref = await SharedPreferences.getInstance();
                                var name = pref.getString('client_name') ??'';
                                var idt = pref.getString('idt')??'';
                                List<Tzakaz1> p = [];
                                for (int i = 0; i < data.length; i++) {
                                  Tzakaz1 tzakaz1 = Tzakaz1(
                                    name: data[i].name,
                                    idSkl2: data[i].idSkl2,
                                    soni: data[i].count,
                                    narhi: data[i].narhi,
                                    snarh: data[i].snarhi,
                                    sm: price.toInt(),
                                  );
                                  p.add(tzakaz1);
                                }
                                OrderModel send = OrderModel(
                                  id: 0,
                                  name: name,
                                  ndoc: '0',
                                  idToch: idt,
                                  izoh: '',
                                  dt: '',
                                  sm: price.toInt(),
                                  tzakaz1: p,
                                );
                                List<OrderModel> order = [];
                                order.add(send);
                                HttpResult response =
                                    await _repository.orderProducts(order);
                                if (response.isSuccess) {
                                  var result =
                                      MessageModel.fromJson(response.result);
                                  if (result.status == true) {
                                    await _repository.clearCart();
                                    ShowErrorDialog.showErrorDialog(
                                      context,
                                      result.message,
                                      'Tasdiqlandi',
                                    );
                                    cartBloc.allCart();
                                  } else {
                                    ShowErrorDialog.showErrorDialog(
                                      context,
                                      'Xatolik',
                                      result.message,
                                    );
                                  }
                                }
                              },
                              text: 'order'.tr()),
                        ],
                      );
              }
              return Container();
            }),
      ),
    );
  }
  usd() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var db = preferences.getString('db');
    http.Response response =
    await http.get(Uri.parse('https://naqshsoft.site/getkurs?DB=$db&'));
    final Map<String, dynamic> data = json.decode(response.body);
    setState(
          () {
        curs = data['KURS'];
      },
    );
  }

  int curs = 0;
}
