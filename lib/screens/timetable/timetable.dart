import 'package:flutter/material.dart';
import 'package:srm_test/models/timetable/timetable.model.dart';
//import 'package:srm_test/models/groups/groups_popup.model.dart';
import 'package:srm_test/controllers/timetable/timetable_controller.dart';

class TimeTable extends StatelessWidget {
  final HttpService httpService = HttpService();

  TimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Align(
                alignment: Alignment.topCenter,
                //check if data is loaded, if loaded then show datalist on child
                child: Table(
                  border: TableBorder.all(width: 2, color: Colors.black45),
                  children: const [
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Группа",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )),
                      TableCell(
                          child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Преподаватель",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )),
                      TableCell(
                          child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "День занятий",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )),
                      TableCell(
                          child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Время занятий",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )),
                      TableCell(
                          child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Аудитория",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )),
                    ])
                  ],
                ))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: Alignment.topCenter,
            //check if data is loaded, if loaded then show datalist on child
            child: FutureBuilder(
              future: httpService.getTimeTable(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TimeTableData>> snapshot) {
                if (snapshot.hasData) {
                  List<TimeTableData> tableunits = snapshot.data!;
                  return Table(
                    //if data is loaded then show table
                    border: TableBorder.all(width: 2, color: Colors.black45),
                    children: tableunits.map(
                      (unit) {
                        return TableRow(//return table row in every loop
                            children: [
                          //table cells inside table row
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(unit.title)),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(unit.name + ' ' + unit.surname)),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(unit.day)),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(unit.time_interval)),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(unit.auditorium)),
                          )),
                        ]);
                      },
                    ).toList(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
