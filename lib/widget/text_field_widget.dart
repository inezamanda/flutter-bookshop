import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String str;
  final TextInputType inputType;
  String? Function(String? value)? validate;
  TextFieldWidget({Key? key, required this.controller, required this.str, this.validate, required this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter your ' + str),
          keyboardType: inputType,
          validator: validate
      ),
    );
  }
}
