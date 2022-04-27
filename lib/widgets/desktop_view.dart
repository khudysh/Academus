import 'package:flutter/material.dart';
import 'package:srm_test/widgets/swith_body.dart';


class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> with RestorationMixin {
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
        leading: GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex.value = 0;
            });
          },
          child: const Padding(
              padding: EdgeInsetsDirectional.only(start: 30),
              child: Icon(
                Icons.school_sharp,
                size: 40,
              )),
          // Text(
          //   'Academus',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
        ),
        title: Padding(
              padding: const EdgeInsetsDirectional.only(start: 35),
          child: Text(
            selectedItem[_selectedIndex.value],
          ),
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
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
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: switchBody(_selectedIndex.value)),
        ],
      ),
    );
  }
}
