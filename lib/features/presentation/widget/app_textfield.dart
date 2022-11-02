import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.readOnly = false,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool? readOnly;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: false,
        readOnly: readOnly!,

        decoration: InputDecoration(
            // border: InputBorder.none,
hintText: hint,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            isDense: true),
      ),
    );
  }
}
