import 'package:flutter/material.dart';

class Roundedbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Roundedbutton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: const Color(0xFFe45a15),
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 20.0,
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF262b50)),
          ),
        ),
      ),
    );
  }
}
