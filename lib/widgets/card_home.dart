import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'switch_body.dart';

class CardHome extends StatelessWidget {
  final String title;
  final IconData icon;
  final String describe;
  final int screenNum;

  const CardHome({Key? key, required this.title, required this.icon, required this.describe, required this.screenNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        hoverColor: Colors.black.withAlpha(3),
        splashColor: Color(0xFFFCBF49).withAlpha(90),
        onTap: () {
          context.read<CurrentScreen>().switchBody(screenNum);
        },
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Color(0xFFd62828),
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
              Padding(padding: EdgeInsets.only(top: 20, left: 15, right: 15), child: Divider(color: Color(0xFFFCBF49),)),
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
