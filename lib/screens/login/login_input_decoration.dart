import 'package:flutter/material.dart';

class InputDecorationLogin {
    static InputDecoration myInputDecoration({String? label, IconData? icon}) {
    return InputDecoration(
      hintText: label, //show label as placeholder
      hintStyle:
          TextStyle(color: Colors.red[300], fontSize: 20), //hint text style
      prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Icon(
            icon,
            color: Colors.red[500],
          )
          //padding and icon for prefix
          ),

      contentPadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              color: Colors.red[300]!, width: 1)), //default border of input

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: Colors.red[200]!, width: 1)), //focus border

      fillColor: const Color.fromARGB(126, 255, 255, 255),
      filled: true, //set true if you want to show input background
    );
  }
}