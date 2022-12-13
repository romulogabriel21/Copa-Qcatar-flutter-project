import 'package:flutter/material.dart';

class MyInputTextFormField extends StatelessWidget {
  final String hintLabel;
  final TextEditingController controller;
  final String returnValidateTextContent;
  final bool hiddenText;

  const MyInputTextFormField({
    Key? key,
    required this.hintLabel,
    required this.controller,
    required this.returnValidateTextContent,
    required this.hiddenText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return returnValidateTextContent;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      obscureText: hiddenText,
    );
  }
}
