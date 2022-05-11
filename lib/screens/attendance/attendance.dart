import 'package:flutter/material.dart';
import 'package:srm_test/models/attendance/attendance.model.dart';
import 'package:http/http.dart' as http;
import 'package:srm_test/models/attendance/attendance_popup.model.dart';
import 'dart:convert';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/controllers/attendance/attendance_controller.dart';
import 'package:srm_test/models/attendance/attendance_expand.model.dart';

Widget exppansionStudents(HttpService httpService, String id) {
  return FutureBuilder(
    future: httpService.getStudents(id),
    builder: (BuildContext context,
        AsyncSnapshot<List<AttendanceStudentsData>> snapshot) {
      print(snapshot);
      if (snapshot.hasData) {
        List<AttendanceStudentsData> students = snapshot.data!;
        return ListView(
          children: students
              .map(
                (AttendanceStudentsData student) => Card(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                          title: Text("${student.name} ${student.surname}")),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

class Attendance extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.topCenter,
        //check if data is loaded, if loaded then show datalist on child
        child: FutureBuilder(
          future: httpService.getGroups(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AttendanceGroupsData>> snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              List<AttendanceGroupsData> groups = snapshot.data!;
              return ListView(
                children: groups
                    .map(
                      (AttendanceGroupsData group) => Card(
                        child: ExpansionTile(
                            title: Text(group.title),
                            subtitle: Text("${group.title} "),
                            trailing:
                                const Icon(Icons.expand_circle_down_outlined),
                            maintainState: false,
                            children: [
                              FutureBuilder(
                                future: httpService.getStudents(group.id),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<AttendanceStudentsData>>
                                        snapshot) {
                                  print(snapshot);
                                  if (snapshot.hasData) {
                                    List<AttendanceStudentsData> students =
                                        snapshot.data!;
                                    return ListView(
                                      shrinkWrap: true,
                                      children: students
                                          .map(
                                            (AttendanceStudentsData student) =>
                                                Card(
                                              color: Color.fromARGB(
                                                  235, 255, 255, 255),
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  ListTile(
                                                    trailing: const Icon(
                                                        Icons.pending_outlined),
                                                    title: Text(
                                                        "${student.name} ${student.surname}"),
                                                                                onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FutureBuilder(
                                      future: httpService.getAttendance(student.id),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<AttendancePopupData>>
                                              snapshot2) {
                                        print(snapshot2);
                                        if (snapshot2.hasData) {
                                          List<AttendancePopupData> studentsPopup =
                                              snapshot2.data!;
                                          return AlertDialog(
                                            insetPadding: EdgeInsets.symmetric(
                                                horizontal: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6,
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
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 60,
                                                        width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                        decoration: BoxDecoration(
                                                            color: CustomTheme
                                                                .lightTheme
                                                                .primaryColor
                                                                .withOpacity(0.8),
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.3)))),
                                                        child: Center(
                                                            child: Text(
                                                                "${student.name} ${student.surname}",
                                                                style: TextStyle(
                                                                  color: CustomTheme
                                                                      .lightTheme
                                                                      .colorScheme
                                                                      .onPrimary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20,
                                                                ))),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.all(
                                                              20.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2))),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                children:
                                                                    studentsPopup
                                                                        .map(
                                                                  (AttendancePopupData
                                                                      studentPopup) {
                                                                    return Column(
                                                                        children: [
                                                                          Card(
                                                                            child: ListTile(
                                                                                title: Text('Имя родителя:'),
                                                                                subtitle: Text(
                                                                                  studentPopup.attendance,
                                                                                  style: TextStyle(fontSize: 18),
                                                                                )),
                                                                          ),
                                                                          Card(
                                                                            child: ListTile(
                                                                                title: Text('Телефон родителя:'),
                                                                                subtitle: Text(
                                                                                  studentPopup.mark,
                                                                                  style: TextStyle(fontSize: 18),
                                                                                )),
                                                                          ),
                                                                          Card(
                                                                            child: ListTile(
                                                                                title: Text('Дополнительная информация:'),
                                                                                subtitle: Text(
                                                                                  studentPopup.lesson_date,
                                                                                  style: TextStyle(fontSize: 18),
                                                                                )),
                                                                          ),
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
                                          return Center(
                                              child: CircularProgressIndicator());
                                        }
                                      },
                                    );
                                  });
                            },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              )
                            ]

                            ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
