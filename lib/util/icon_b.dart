import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  const Iconbutton({
    Key? key,
    required this.text,
    required this.iconb,
    required this.colour,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final Icon iconb;
  final Color colour;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconButton(
            iconSize: 50.0,
            onPressed: onpressed,
            icon: iconb,
            color: colour,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
