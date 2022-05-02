import 'package:flutter/material.dart';
import 'package:srm_test/widgets/home_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final standartPadding = 110.0;

  @override
  Widget build(BuildContext context) {
    print("rebuild HomeCard");

    // final isDesktop = isDisplayDesktop(context);
    // if (isDesktop) {
    return
        GridView(

    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300.0,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0,
    ),
          children: const [
             HomeCard(
                title: "Расписание",
                icon: Icons.schedule,
                describe:
                    "Расписание занятий по кабинетам",
                screenNum: 1,
              ),
            HomeCard(
                title: "Журнал",
                icon: Icons.app_registration,
                describe:
                    "Журнал посещений и темы уроков",
                    screenNum: 2,
              ),
           HomeCard(
                title: "Группы",
                icon: Icons.groups,
                describe:
                    "Группы, их расписание и состав",
                    screenNum: 3,
              ),
            HomeCard(
                title: "Ученики",
                icon: Icons.person_search,
                describe:
                    "Информация по всем ученикам",
                   screenNum: 4,
              ),

          ],

    );
  //   }
  //   else {
  //     return Text("f");
  // }
  }
}
