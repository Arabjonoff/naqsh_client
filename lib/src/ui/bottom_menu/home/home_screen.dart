import 'package:flutter/material.dart';
import 'package:naqsh_client/src/bloc/category/category_bloc.dart';
import 'package:naqsh_client/src/model/category/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  final db;
   HomeScreen({Key? key,  this.db}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState(){
    super.initState();
    categoryBloc.getCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriyalar'),
      ),
      body: SafeArea(
        child: StreamBuilder<CategoryModel>(
          stream: categoryBloc.getCategories,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              const Center(child: CircularProgressIndicator.adaptive(),);
            }
            else if(snapshot.hasError){
              const Center(child: Text('error'),);
            }
            else{
              var data = snapshot.data!.result;
              return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/detail',arguments: data[index]);
                      },
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            Expanded(child: CachedNetworkImage(
                              imageUrl: "https://naqshsoft.site/images/tip/002/tp${data[index].id}.png",
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.image),
                            ),),
                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].name,maxLines: 1 ,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }
        )
      ),
    );
  }
}
