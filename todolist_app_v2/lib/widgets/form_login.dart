import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? labelText;
  final bool? obscureText;

  const Formulario({
    super.key,
    this.focusNode,
    required this.controller,
    required this.validator,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.red),
        ),
        isDense: true,
      ),
    );
  }
}
