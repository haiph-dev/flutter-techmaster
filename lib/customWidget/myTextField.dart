import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? lebelText;
  final String? hintText;
  final TextInputType textInputType;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final bool? obscureText;

  const myTextField(
      {super.key,
      required this.controller,
      this.lebelText,
      this.hintText,
      required this.textInputType,
      required this.textCapitalization,
      this.suffixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: TextField(controller: controller),
      ),
    ]);
  }
}
