import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  CustomInputField({this.textEditingController, this.hintText});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 380,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: TextField(
          controller: textEditingController,
          decoration: new InputDecoration(
            hintText: hintText,
          ),
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ),
    );
  }
}
