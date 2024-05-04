import 'package:flutter/material.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild(
      {super.key,
      required this.hintText,
      this.onChange,
      required this.validator});
  final Function(String? value)? onChange;
  final String hintText;
  final String? Function(String? value) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
