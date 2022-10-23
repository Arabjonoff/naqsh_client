import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/cart');}, icon: const Icon(Icons.shopping_cart_outlined))],
      ),
      body: SafeArea(
        child: GridView.builder(
      padding: const EdgeInsets.all(16),
        itemCount: 14,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16),
        itemBuilder: (context,index){
          return Card(
            child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Lorem ipsum dolor',maxLines: 1 ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(child: const Text('Savatga olish',style: TextStyle(color: Colors.white),)),
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(child: Icon(Icons.remove)),
                  //     Expanded(child: Center(child: Text('1'))),
                  //     Expanded(child: Icon(Icons.add)),
                  //   ],
                  // ),
                ),
              ],
            ),
          );
        }),

    ),
    );
  }

}
