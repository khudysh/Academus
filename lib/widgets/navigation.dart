import 'package:flutter/material.dart';

class NavRailDemo extends StatefulWidget {
  const NavRailDemo({Key? key}) : super(key: key);

  @override
  _NavRailDemoState createState() => _NavRailDemoState();
}

class _NavRailDemoState extends State<NavRailDemo> with RestorationMixin {
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
    final destinationFirst = "First";
    final destinationSecond = "Second";
    final destinationThird = "Third";
    final selectedItem = <String>[
      destinationFirst,
      destinationSecond,
      destinationThird
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "localization.demoNavigationRailTitle",
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
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
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: Text(
                selectedItem[_selectedIndex.value],
              ),
            ),
          ),
        ],
      ),
    );
  }
}