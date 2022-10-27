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
                         data[index].count ==0?GestureDetector(
                           onTap: (){
                             setState((){
                               categoryDetailBloc.updateCart(data[index], false);
                             });
                           },
                           child: Container(
                             margin: const EdgeInsets.symmetric(horizontal: 8),
                             padding: const EdgeInsets.symmetric(vertical: 7),
                             decoration: BoxDecoration(
                                 color: Colors.indigo,
                                 borderRadius: BorderRadius.circular(5)
                             ),
                             width: MediaQuery.of(context).size.width,
                             child: const Center(child: Text('Savatga olish',style: TextStyle(color: Colors.white),)),
                           ),
                         ):
                         Container(
                           margin: const EdgeInsets.symmetric(
                             horizontal: 10
                           ),
                           width: MediaQuery.of(context).size.width,
                           child: Row(
                             children: [
                              GestureDetector(
                                 onTap: () {
                                   setState(() {
                                     categoryDetailBloc.updateCart(
                                         data[index],
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
                                     color:
                                     Colors.indigo,
                                   ),
                                   padding:
                                   const EdgeInsets
                                       .symmetric(
                                       horizontal: 5,
                                       vertical: 3.5),
                                   child: const Icon(
                                     Icons.remove,
                                     color: Colors.white,
                                   ),
                                 ),
                               ),
                               Expanded(
                                   child: Center(
                                       child: Text(
                                         data[index].count.toString(),
                                         style: TextStyle(
                                             fontWeight:
                                             FontWeight.w600),
                                       ))),
                               GestureDetector(
                                 onTap: () {
                                   setState(() {
                                     categoryDetailBloc.updateCart(
                                         data[index], false);
                                   });
                                 },
                                 child: Container(
                                   padding: const EdgeInsets
                                       .symmetric(
                                       horizontal: 5,
                                       vertical: 3.5),
                                   decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.circular(
                                         5),
                                     color: Colors.indigo,
                                   ),
                                   child: const Icon(
                                     Icons.add,
                                     color: Colors.white,
                                   ),
                                 ),
                               ),
                             ],
                           ),
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
