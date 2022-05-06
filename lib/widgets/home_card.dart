import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app/switch_body.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String describe;
  final int screenNum;

  const HomeCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.describe,
      required this.screenNum})
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
          width: 350,
          height: 300,
          child: Column(
            children: [
              FittedBox(
                // 2
                fit: BoxFit.contain,
                // 3
                child: Center(
                  child: Icon(
                    icon,
                    color: const Color(0xFFd62828),
                    size: 72,
                  ),
                ),
              ),
              FittedBox(
                // 2
                fit: BoxFit.contain,
                // 3
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Divider(
                    color: Color(0xFFFCBF49),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child:Text(
                describe,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans'),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
