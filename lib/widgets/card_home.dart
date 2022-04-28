import 'dart:html';

import 'package:flutter/material.dart';
import 'swith_body.dart';

class CardHome extends StatelessWidget {
  final String title;
  final IconData icon;
  final String describe;

  const CardHome({Key? key, required this.title, required this.icon, required this.describe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.red.withAlpha(30),
        onTap: () {
          print("Tapped $title card");
        },
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Colors.blue[500],
                  size: 72,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30), child: Divider()),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: Text(describe, textAlign: TextAlign.center),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
