import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.text,
    required this.save,
    required this.keyboard,
    this.preText,
    super.key,
  });

  final String text;
  final TextEditingController save;
  final TextInputType keyboard;
  final String? preText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: save,
      keyboardType: keyboard,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(15),
        prefixText: preText ?? '',
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5,
          ),
        ),
      ),
      // maxLength: 30,
    );
  }
}
