import 'package:flutter/material.dart';
import 'package:srm_test/widgets/swithBody.dart';
import 'package:srm_test/widgets/navigation.dart';
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

    final destinationRegister = "Журнал";
    final destinationTimetable = "Расписание";
    final destinationGroups = "Группы";
    final destinationStudents = "Ученики";
    final destinationHome = "Главная";
    final selectedItem = <String>[
      destinationHome,
      destinationRegister,
      destinationTimetable,
      destinationGroups,
      destinationStudents,
    ];
      return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedItem[_selectedIndex.value],
          ),
        ),
        body: Row(
          children: [
            NavigationRail(
              leading: FloatingActionButton(
                onPressed: () {setState(() {
                  _selectedIndex.value = 0;
                });},
                child: const Icon(Icons.person_rounded),
              ),
              selectedIndex: _selectedIndex.value,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex.value = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: const Icon(
                    Icons.home,
                  ),
                  label: Text(
                    destinationHome,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                  selectedIcon: const Icon(
                    Icons.favorite,
                  ),
                  label: Text(
                    destinationRegister,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.bookmark_border,
                  ),
                  selectedIcon: const Icon(
                    Icons.book,
                  ),
                  label: Text(
                    destinationTimetable,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.star_border,
                  ),
                  selectedIcon: const Icon(
                    Icons.star,
                  ),
                  label: Text(
                    destinationGroups,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                  selectedIcon: const Icon(
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