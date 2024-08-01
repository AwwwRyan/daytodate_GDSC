import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF535353),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          keyboardType: TextInputType.numberWithOptions(),
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          controller: controller,
          cursorColor: Color(0xFF98A2B3),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF98A2B3), fontSize: 18),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // Remove the border side to avoid overlap
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // Remove the border side to avoid overlap
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // Remove the border side to avoid overlap
            ),
            filled: true, // This ensures the container's color is applied within the TextField's border
            fillColor: Colors.transparent, // Ensures the container's color shows through
          ),
        ),
      ),
    );
  }
}
