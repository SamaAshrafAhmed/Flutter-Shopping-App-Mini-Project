import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.validator,
    this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  final String label;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
