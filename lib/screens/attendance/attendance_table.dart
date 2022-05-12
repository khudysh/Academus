import 'package:flutter/material.dart';
import 'package:srm_test/models/attendance/attendance_popup.model.dart';

class AttendanceTable extends StatefulWidget {
  const AttendanceTable({Key? key, required this.studentsPopup})
      : super(key: key);
  final studentsPopup;
  @override
  State<AttendanceTable> createState() => _AttendanceTableState(studentsPopup);
}

class _AttendanceTableState extends State<AttendanceTable> {
  final studentsPopup;
  _AttendanceTableState(this.studentsPopup);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2))),
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(width: 2, color: Colors.black45),
              children: studentsPopup.map(
                (AttendancePopupData studentPopup) {
                  return TableRow(children: [
                    TableCell(
                        child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(studentPopup.lesson_date)),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(studentPopup.topic)),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: DropdownButton<String>(
                            value: studentPopup.attendance,
                            icon: const Text(""),
                            elevation: 16,
                            style: const TextStyle(color: Colors.red),
                            underline: Container(
                              height: 2,
                              color: Colors.red,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                studentPopup.attendance = newValue!;
                              });
                            },
                            items: <String>[
                              '✅',
                              '❌',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(studentPopup.mark)),
                    )),
                  ]);
                },
              ).toList(),
            ),
          ),
        ));
  }
}
