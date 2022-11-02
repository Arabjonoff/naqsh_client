import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/bloc/cart/cart_bloc.dart';
import 'package:naqsh_client/src/bloc/category/category_detail/category_detail_bloc.dart';
import 'package:naqsh_client/src/bloc/database/login_database.dart';
import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/model_all/model_all.dart';
import 'package:naqsh_client/src/widget/image/image_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/category/category_model.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final CategoryResult data;

  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  initState() {
    super.initState();
    categoryDetailBloc.getCategoryDetail(widget.data.st, widget.data.id);
    dataBase.getLoginDatabase();
    usd();
  }

  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/cart',
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<ModelAll>(
          stream: categoryDetailBloc.categoryDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              LoginModel list = snapshot.data!.loginModel;
              List<ProductResult> getCategory =
                  snapshot.data!.categoryDetailModel.data;
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: getCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ImageWidget(
                          id: getCategory[index].idSkl2,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            getCategory[index].name,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'price'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              getCategory[index].snarhiS != 0.0
                                  ? Text(
                                      '${getCategory[index].snarhiS * curs} ${'sum'.tr()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15))
                                  : Text(
                                      "${getCategory[index].snarhi} ${'sum'.tr()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                            ],
                          ),
                        ),
                        list.d4 == 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'residual'.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    getCategory[index].snarhiS != 0.0
                                        ? Text(
                                            getCategory[index]
                                                .snarhiS
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15))
                                        : Text(
                                            getCategory[index].osoni.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                  ],
                                ),
                              )
                            : Container(),
                        getCategory[index].count > 0
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          categoryDetailBloc.updateCart(
                                              getCategory[index], true);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFF5F6DF8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3.5),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          getCategory[index].count.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          setState(() {
                                            categoryDetailBloc.updateCart(
                                                getCategory[index], false);
                                          });
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFF5F6DF8),
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
                            : GestureDetector(
                                onTap: () {
                                  list.d2 == 1
                                      ? setState(() {
                                          categoryDetailBloc.updateCart(
                                              getCategory[index], false);
                                        })
                                      : null;
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  decoration: BoxDecoration(
                                      color: list.d2 == 1
                                          ? const Color(0xFF5F6DF8)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      'add_cart'.tr(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
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
