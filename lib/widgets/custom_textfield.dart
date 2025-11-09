import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.textEditingController
  });
  final String label;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

