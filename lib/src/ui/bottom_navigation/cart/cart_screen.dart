import 'package:flutter/material.dart';
import 'package:naqsh_client/src/widget/button/ontap_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      child:Row(children: [
                        Container(
                          width: 90,
                          height: 90,
                          color: Colors.blue,
                        ),
                        Expanded(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text('lorem ipsum dolors'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text('230 011 som'),
                                ),
                                Container(
                                  width: 150,
                                  margin: const EdgeInsets.only(right: 16),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: Icon(Icons.remove)),
                                      Expanded(child: Center(child: Text('1'))),
                                      Expanded(child: Icon(Icons.add)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),),
                      ],
                      ),
                    ),
                  );
                },
              ),
            ),
            OnTapWidget(onTap: (){

            }, text: 'Buyurtma berish')
          ],
        ),
      ),
    );
  }
}
