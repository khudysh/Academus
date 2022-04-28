import 'package:flutter/material.dart';
import 'package:srm_test/widgets/card_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final standartPadding = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: standartPadding, right: standartPadding, top: standartPadding+55),
              child: const CardHome(
                title: "Расписание",
                icon: Icons.schedule,
                describe: "Здесь можно посмотреть расписание занятий в разных кабинетах, а также изменить его",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: standartPadding, right: standartPadding, top: standartPadding+55),
              child: const CardHome(
                title: "Журнал",
                icon: Icons.app_registration,
                describe: "Здесь можно посмотреть журнал посещений, отметить присутствующих, прописать темы уроков",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: standartPadding, right: standartPadding, top: standartPadding+55),
              child: const CardHome(
                title: "Группы",
                icon: Icons.groups,
                describe: "Здесь можно посмотреть все группы, их расписание и состав",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: standartPadding, right: standartPadding, top: standartPadding+55),
              child: const CardHome(
                title: "Ученики",
                icon: Icons.person_search,
                describe: "Здесь можно посмотреть информацию по каждому отдельному ученику",
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.all(standartPadding),
        //       child: CardHome(
        //         icon: Icons.schedule,
        //         title: "Расписание",
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(standartPadding),
        //       child: CardHome(
        //         icon: Icons.schedule,
        //         title: "Журнал",
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(standartPadding),
        //       child: CardHome(
        //         icon: Icons.schedule,
        //         title: "Группы",
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(standartPadding),
        //       child: CardHome(
        //         icon: Icons.schedule,
        //         title: "Ученики",
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
