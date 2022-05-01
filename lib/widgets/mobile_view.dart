import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/switch_body.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with RestorationMixin {
  final RestorableInt _selectedIndex = RestorableInt(0);

  @override
  String get restorationId => 'nav_rail_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedIndex, 'selected_index');
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const destinationRegister = "Журнал";
    const destinationTimetable = "Расписание";
    const destinationGroups = "Группы";
    const destinationStudents = "Ученики";
    const destinationHome = "Главная";
    final selectedItem = <String>[
      destinationHome,
      destinationRegister,
      destinationTimetable,
      destinationGroups,
      destinationStudents,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem[_selectedIndex.value]),
      ),
      body: context.watch<CurrentScreen>().getCurrentScreen,
      drawer: SizedBox(
        width: 100,
        child: Drawer(
          child: NavigationRail(
            selectedIndex: _selectedIndex.value,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex.value = index;
              });
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
                  Icons.favorite_border,
                ),
                selectedIcon: Icon(
                  Icons.favorite,
                ),
                label: Text(
                  destinationRegister,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                selectedIcon: Icon(
                  Icons.book,
                ),
                label: Text(
                  destinationTimetable,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.star_border,
                ),
                selectedIcon: Icon(
                  Icons.star,
                ),
                label: Text(
                  destinationGroups,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.favorite_border,
                ),
                selectedIcon: Icon(
                  Icons.favorite,
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
