import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blackButton extends StatelessWidget {
  final String text;
  final onTab;
  const blackButton({super.key, this.onTab, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        onPressed:onTab,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Color(0XFF999999),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Adjust the radius to make it more rectangular
          ),),
      ),
    );
  }
}
