import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final List<Map> _books = [
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
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Monday')),
      const DataColumn(label: Text('Tuesday')),
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
        ? TextFormField(initialValue: bookTitle, style: const TextStyle(fontSize: 14))
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
        const Text(
          'Edit mode',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}