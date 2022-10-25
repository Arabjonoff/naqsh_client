import 'package:flutter/material.dart';
import 'package:naqsh_client/src/bloc/category/category_detail/category_detail_bloc.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import '../../model/category/category_model.dart';

class DetailScreen extends StatefulWidget {
  final CategoryResult data;
  const DetailScreen({Key? key, required this.data,}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  initState(){
    super.initState();
    categoryDetailBloc.getCategoryDetail(widget.data.st, widget.data.id);
  }

  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name),
        actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/cart');}, icon: const Icon(Icons.shopping_cart_outlined))],
      ),
      body: SafeArea(
        child: StreamBuilder<GetCategoryDetailModel>(
          stream: categoryDetailBloc.categoryDetail,
          builder: (context, snapshot) {
           if(snapshot.hasData){
             var data = snapshot.data!.data;
             return GridView.builder(
                 padding: const EdgeInsets.all(16),
                 itemCount: data.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16),
                 itemBuilder: (context,index){
                   return Card(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  [
                          Expanded(child: Center(child:Icon(Icons.image))),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                           child: Text(data[index].name),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const Text('Narxi',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                               Text(data[index].snarhi.toString() + ' uzs',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                             ],
                           ),
                         ),
                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 8),
                           padding: const EdgeInsets.symmetric(vertical: 2),
                           decoration: BoxDecoration(
                               color: Colors.indigo,
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
                         const SizedBox(height: 8,),
                       ],
                     ),
                   );
                 });
           }
           return const Center(child: CircularProgressIndicator());
          }
        ),

    ),
    );
  }
}
