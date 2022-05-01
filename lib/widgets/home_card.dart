import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/switch_body.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String describe;
  final int screenNum;

  const HomeCard({Key? key, required this.title, required this.icon, required this.describe, required this.screenNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild HomeCard");
    return Card(
      child: InkWell(
        hoverColor: Colors.black.withAlpha(3),
        splashColor: const Color(0xFFFCBF49).withAlpha(90),
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
                  color: const Color(0xFFd62828),
                  size: 72,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20, left: 15, right: 15), child: Divider(color: Color(0xFFFCBF49),)),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
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
