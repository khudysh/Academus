import 'package:flutter/material.dart';
import 'package:srm_test/models/attendance/attendance_popup.model.dart';
import 'package:srm_test/resources/theme.dart';

class ShowDialog extends StatefulWidget {
    final dynamic httpService;
  final dynamic student;
    const ShowDialog({Key? key, required this.httpService, required this.student})
      : super(key: key);


  @override
  State<ShowDialog> createState() => _ShowDialogState(httpService, student);
}

class _ShowDialogState extends State<ShowDialog> {
    final dynamic httpService;
  final dynamic student;

  _ShowDialogState(this.httpService, this.student);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getAttendance(student.id),
      builder: (BuildContext context,
          AsyncSnapshot<List<AttendancePopupData>> snapshot2) {
        if (snapshot2.hasData) {
          List<AttendancePopupData> studentsPopup = snapshot2.data!;
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8,
                vertical: 24),
            contentPadding: EdgeInsets.zero,
            content: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  right: -15.0,
                  top: -15.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.close_outlined,
                        size: 18,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomTheme.lightTheme.primaryColor
                            .withOpacity(0.8),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.3)))),
                    child: Center(
                        child: Text("${student.name} ${student.surname}",
                            style: TextStyle(
                              color:
                                  CustomTheme.lightTheme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          //check if data is loaded, if loaded then show datalist on child
                          child: Table(
                            border: TableBorder.all(
                                width: 2, color: Colors.black45),
                            children: const [
                              TableRow(children: [
                                TableCell(
                                    child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Дата занятия",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                )),
                                TableCell(
                                    child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Тема",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                )),
                                TableCell(
                                    child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Присутствие",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                )),
                                TableCell(
                                    child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Оценка",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                )),
                              ])
                            ],
                          ))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2))),
                        child: SingleChildScrollView(
                          child: Table(
                            border: TableBorder.all(
                                width: 2, color: Colors.black45),
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
                                          icon:
                                              Text(""),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.red),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.red,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              studentPopup.attendance =
                                                  newValue!;
                                            });
                                          },
                                          items: <String>[
                                            '✅',
                                            '❌',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
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
                      )),
                ]),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
