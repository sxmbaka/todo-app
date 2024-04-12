import 'package:flutter/material.dart';

class DialogBoxButtom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DialogBoxButtom({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Text(text),
    );
  }
}
