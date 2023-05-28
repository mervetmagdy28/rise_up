import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller, required this.validator, required this.hintText, this.obscureText=false, required this.labelText}) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final String labelText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      controller: controller,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration:  InputDecoration(
        label: Text(labelText),
        hintText: hintText,
        labelStyle:const TextStyle(color: Colors.black),
        filled: true,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder:buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide:
        BorderSide(
          //color: kSecondColor,
            width: 1),
      );
  }
}
