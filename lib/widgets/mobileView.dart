import 'package:flutter/material.dart';
import 'package:srm_test/widgets/swithBody.dart';

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
    final destinationFirst = "Журнал";
    final destinationSecond = "Расписание";
    final destinationThird = "Группы";
    final destinationFour = "Ученики";
    final selectedItem = <String>[
      destinationFirst,
      destinationSecond,
      destinationThird,
      destinationFour,
    ];
      return Scaffold(
        appBar: AppBar(
          title: Text(selectedItem[_selectedIndex.value]),
        ),
        body: Text("ff"),
        // body: switchBody(_selectedIndex.value),
        drawer: Container(
          width: 100,
          child: Drawer(
            child: NavigationRail(
              leading: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
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
                    Icons.favorite_border,
                  ),
                  selectedIcon: const Icon(
                    Icons.favorite,
                  ),
                  label: Text(
                    destinationFirst,
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
                    destinationSecond,
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
                    destinationThird,
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
                    destinationFour,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }


}