import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final String value;
  const TextWidget({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 3,
          ),
          Text(value),
        ],
      ),
    );
  }
}
