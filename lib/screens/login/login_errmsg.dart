import 'package:flutter/material.dart';

class ErrMsg extends StatelessWidget {

  final String text;
  const ErrMsg({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.00),
      margin: const EdgeInsets.only(bottom: 10.00),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
          border: Border.all(color: Colors.red[300]!, width: 2)),
      child: Row(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 6.00),
          child: const Icon(Icons.info, color: Colors.white),
        ), // icon for error message

        Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.clip),
        //show error message text
      ]),
    );
  }
}