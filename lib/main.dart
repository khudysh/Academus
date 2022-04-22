import 'package:flutter/material.dart';
import 'package:srm_test/settings/adaptive.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Eugene",
      home: StudyCrm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudyCrm extends StatefulWidget {
  const StudyCrm({Key? key}) : super(key: key);

  @override
  State<StudyCrm> createState() => _StudyCrmState();
}

class _StudyCrmState extends State<StudyCrm> with RestorationMixin {
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
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) {
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
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: switchBody(_selectedIndex.value)),
          ],
        ),
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Menu"),
              ),
              body: Text("ffgdfdg"),
              drawer: Drawer(),
            ),
          ),
        ],
      );
    }
  }

  Widget switchBody(int selectedIndex) {
    if (selectedIndex == 0) {
      return Groups();
    } else {
      return Text("GG");
    }
  }
}

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

// ----------------------------------------TimeTable Widget--------------------------
class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Map> _books = [
    {'id': 1, 'title': 'Monday', 'author': 'David John'},
    {'id': 2, 'title': 'Tuesday', 'author': 'Merlin Nick'},
    {'id': 3, 'title': 'Wednesday', 'author': 'David John'},
    {'id': 4, 'title': 'Thursday', 'author': 'David John'},
    {'id': 5, 'title': 'Friday', 'author': 'David John'},
    {'id': 6, 'title': 'Saturday', 'author': 'David John'},
    {'id': 7, 'title': 'Sunday', 'author': 'David John'},
  ];
  bool? _isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListView(
      children: [_createDataTable(), _createCheckboxField()],
    ));
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Monday')),
      DataColumn(label: Text('Tuesday')),
      // DataColumn(label: Text('Wednesday')),
      // DataColumn(label: Text('Thursday')),
      // DataColumn(label: Text('Friday')),
      // DataColumn(label: Text('Saturday')),
      // DataColumn(label: Text('Sunday')),
    ];
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
              DataCell(Text('#' + book['id'].toString())),
              _createTitleCell(book['title']),
              DataCell(Text(book['author']))
            ]))
        .toList();
  }

  DataCell _createTitleCell(bookTitle) {
    return DataCell(_isEditMode == true
        ? TextFormField(initialValue: bookTitle, style: TextStyle(fontSize: 14))
        : Text(bookTitle));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        Text(
          'Edit mode',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
// ----------------------------------------TimeTable Widget--------------------------

// ----------------------------------------Groups Widget-----------------------------

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  List<Map> _books = [
    {'id': 1, 'title': 'Monday', 'author': 'David John'},
    {'id': 2, 'title': 'Tuesday', 'author': 'Merlin Nick'},
    {'id': 3, 'title': 'Wednesday', 'author': 'David John'},
    {'id': 4, 'title': 'Thursday', 'author': 'David John'},
    {'id': 5, 'title': 'Friday', 'author': 'David John'},
    {'id': 6, 'title': 'Saturday', 'author': 'David John'},
    {'id': 7, 'title': 'Sunday', 'author': 'David John'},
  ];
  bool? _isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListView(
      children: [_createDataTable(), _createCheckboxField()],
    ));
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Monday')),
      DataColumn(label: Text('Tuesday')),
      // DataColumn(label: Text('Wednesday')),
      // DataColumn(label: Text('Thursday')),
      // DataColumn(label: Text('Friday')),
      // DataColumn(label: Text('Saturday')),
      // DataColumn(label: Text('Sunday')),
    ];
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
              DataCell(Text('#' + book['id'].toString())),
              _createTitleCell(book['title']),
              DataCell(Text(book['author']))
            ]))
        .toList();
  }

  DataCell _createTitleCell(bookTitle) {
    return DataCell(_isEditMode == true
        ? TextFormField(initialValue: bookTitle, style: TextStyle(fontSize: 14))
        : Text(bookTitle));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        Text(
          'Edit mode',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
// ----------------------------------------Groups Widget-----------------------------
