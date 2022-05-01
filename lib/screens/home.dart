import 'package:flutter/material.dart';
import 'package:srm_test/widgets/card_home.dart';
import 'package:srm_test/settings/adaptive.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final standartPadding = 110.0;

  @override
  Widget build(BuildContext context) {
    print("rebuild CardHome");

    // final isDesktop = isDisplayDesktop(context);
    // if (isDesktop) {
    return 
      
        GridView.extent(
           maxCrossAxisExtent: 300.0,
           
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
          children: [
             const CardHome(
                title: "Расписание",
                icon: Icons.schedule,
                describe:
                    "Здесь можно посмотреть расписание занятий в разных кабинетах, а также изменить его",
                screenNum: 1,
              ),
            const CardHome(
                title: "Журнал",
                icon: Icons.app_registration,
                describe:
                    "Здесь можно посмотреть журнал посещений, отметить присутствующих, прописать темы уроков",
                    screenNum: 2,
              ),
           const CardHome(
                title: "Группы",
                icon: Icons.groups,
                describe:
                    "Здесь можно посмотреть все группы, их расписание и состав",
                    screenNum: 3,
              ),
            const CardHome(
                title: "Ученики",
                icon: Icons.person_search,
                describe:
                    "Здесь можно посмотреть информацию по каждому отдельному ученику",
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
