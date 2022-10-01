import 'package:flutter/material.dart';

const mescreenfield = InputDecoration(
  labelStyle: TextStyle(
    color: Color(0xFF262b50),
  ),
  prefixIcon: Icon(
    Icons.work,
    color: Color(0xFF262b50),
  ),
  labelText: 'Skill ',
  floatingLabelBehavior: FloatingLabelBehavior.always,
  hintText: 'job',
  hintStyle:
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF262b50), width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF9AB4C2),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);
