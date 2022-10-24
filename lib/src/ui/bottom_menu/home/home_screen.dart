import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ss'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
            itemCount: 14,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16),
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/detail');
            },
            child: Card(
              color: Colors.blue,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Lorem ipsum dolor',maxLines: 1 ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
