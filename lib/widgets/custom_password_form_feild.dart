import 'package:flutter/material.dart';

class CustomPasswordFromFeild extends StatefulWidget {
  const CustomPasswordFromFeild(
      {super.key,
      required this.hintText,
      this.onChange,
      required this.validator});
  final Function(String? value)? onChange;
  final String hintText;
  final String? Function(String? value) validator;

  @override
  State<CustomPasswordFromFeild> createState() =>
      _CustomPasswordFromFeildState();
}

class _CustomPasswordFromFeildState extends State<CustomPasswordFromFeild> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          color: Colors.white,
          icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        ),
        hintText: widget.hintText,
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
