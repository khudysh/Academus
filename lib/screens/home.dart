import 'package:flutter/material.dart';
import 'package:srm_test/widgets/card_home.dart';
import 'package:srm_test/settings/adaptive.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final standartPadding = 110.0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: standartPadding),
              child: const CardHome(
                title: "Расписание",
                icon: Icons.schedule,
                describe:
                    "Здесь можно посмотреть расписание занятий в разных кабинетах, а также изменить его",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: standartPadding),
              child: const CardHome(
                title: "Журнал",
                icon: Icons.app_registration,
                describe:
                    "Здесь можно посмотреть журнал посещений, отметить присутствующих, прописать темы уроков",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: standartPadding),
              child: const CardHome(
                title: "Группы",
                icon: Icons.groups,
                describe:
                    "Здесь можно посмотреть все группы, их расписание и состав",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: standartPadding),
              child: const CardHome(
                title: "Ученики",
                icon: Icons.person_search,
                describe:
                    "Здесь можно посмотреть информацию по каждому отдельному ученику",
              ),
            ),
          ],
        ),
        Padding(
              padding: EdgeInsets.only(
                  left: standartPadding,
                  right: standartPadding,
                  top: standartPadding),
              child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Expanded(
              flex: 2,
              child: CardHome(
                icon: Icons.schedule,
                title: "Расписание",
                describe:
                    "Здесь можно посмотреть информацию по каждому отдельному ученику",
              ),
            ),
            Expanded(
              child: CardHome(
                icon: Icons.schedule,
                title: "Расписание",
                describe:
                    "Здесь можно посмотреть информацию по каждому отдельному ученику",
              ),
            ),
          ],
        ),
        ),
      ],
    );
    }
    else {
      return Text("f");
  }
  }
}
