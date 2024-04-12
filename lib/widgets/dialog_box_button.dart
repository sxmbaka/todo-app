import 'package:flutter/material.dart';

class DialogBoxButtom extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DialogBoxButtom({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    );
  }
}
