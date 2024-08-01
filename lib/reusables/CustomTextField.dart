import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;  // New optional argument

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,  // Added to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF98A2B3),fontWeight: FontWeight.w500
        ),
        controller: controller,
        cursorColor: Color(0xFF98A2B3),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF98A2B3),fontSize: 18),
          suffixIcon: suffixIcon,  // Added suffixIcon to the decoration
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFFEAECF0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFFEAECF0), // Enabled border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFFEAECF0), // Focused border color
            ),
          ),
        ),
      ),
    );
  }
}