import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/routes.dart';
import 'package:srm_test/resources/const.dart';
class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild DesktopView");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: InkWell(
            splashColor: const Color.fromARGB(0, 0, 0, 0),
            onTap: () {
              context.read<CurrentScreen>().switchBody(0);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: Row(
                children: const [
                  Text(
                    'A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.school_sharp,
                    size: 40,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 5),
                    child: Text(
                      'S',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 35),
          child: Text(
            selectedItem[context.watch<CurrentScreen>().getCurrentScreenNum],
          ),
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: context.watch<CurrentScreen>().getCurrentScreenNum,
            onDestinationSelected: (index) {
              context.read<CurrentScreen>().switchBody(index);
              //Navigator.pushReplacementNamed(context, Routes.routes[index]!);
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                selectedIcon: Icon(
                  Icons.home,
                ),
                label: Text(
                  destinationHome,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.schedule_outlined,
                ),
                selectedIcon: Icon(
                  Icons.schedule,
                ),
                label: Text(
                  destinationTimetable,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.app_registration_outlined,
                ),
                selectedIcon: Icon(
                  Icons.app_registration,
                ),
                label: Text(
                  destinationRegister,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.groups_outlined,
                ),
                selectedIcon: Icon(
                  Icons.groups,
                ),
                label: Text(
                  destinationGroups,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_search_outlined),
                selectedIcon: Icon(
                  Icons.person_search,
                ),
                label: Text(
                  destinationStudents,
                ),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: context.watch<CurrentScreen>().getCurrentScreen),
        ],
      ),
    );
  }
}
