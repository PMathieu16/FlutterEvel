import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;

  const CustomTextField(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.filled = false,
        this.validator,
        this.hasAsterisks = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisks,
      validator: (value) {
        if (validator != null) return validator!(value);
      },
      controller: controller,
      decoration: InputDecoration(
          hintText: '$hintText',
          border: OutlineInputBorder(),
          filled: filled,
          fillColor: Colors.white
      ),
    );
  }
}
