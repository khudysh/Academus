import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/resources/const.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild DesktopView");

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem[context.watch<CurrentScreen>().getCurrentScreenNum]),
      ),
      body: context.watch<CurrentScreen>().getCurrentScreen,
      drawer: SizedBox(
        width: 100,
        child: Drawer(
          child: NavigationRail(
            groupAlignment: -0.7,
            selectedIndex: context.watch<CurrentScreen>().getCurrentScreenNum,
            onDestinationSelected: (index) {
              context.read<CurrentScreen>().switchBody(index);
            },
            labelType: NavigationRailLabelType.selected,
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
        ),
      ),
    );
  }
}
