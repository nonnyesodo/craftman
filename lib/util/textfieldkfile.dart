import 'package:flutter/material.dart';

const ktextfield = InputDecoration(
  hintStyle:
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
  labelStyle: TextStyle(color: Colors.white),
  labelText: 'enter a value',
  floatingLabelBehavior: FloatingLabelBehavior.always,
  hintText: 'enter a value',
  prefixIcon: Icon(Icons.abc),
  suffixIcon: Icon(Icons.abc),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
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
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF9AB4C2),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);
