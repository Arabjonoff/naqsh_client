import 'package:flutter/material.dart';

class OnTapWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  const OnTapWidget({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFF5F6DF8)
        ),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),),
      ),
    );
  }
}
