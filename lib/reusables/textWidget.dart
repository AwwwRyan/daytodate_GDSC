import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  final String text;
   const textWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),
    );
  }
}
