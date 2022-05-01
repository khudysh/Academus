import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/controllers/switch_body.dart';
import 'package:srm_test/resources/const.dart';
import 'package:srm_test/routes.dart';
class Navigation extends StatelessWidget{
  final double groupAlign;
   const Navigation({Key? key, required this.groupAlign}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("rebuild Navigation");
    return NavigationRail(
            groupAlignment: groupAlign,
            selectedIndex: context.watch<CurrentScreen>().getCurrentScreenNum,
            onDestinationSelected: (index) {
              context.read<CurrentScreen>().switchBody(index);
              //! Найти как пофиксить анимацию для роутинга, разобраться почему не работает group
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
          );
  }


}