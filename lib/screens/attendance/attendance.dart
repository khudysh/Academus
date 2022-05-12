import 'package:flutter/material.dart';
import 'package:srm_test/models/attendance/attendance.model.dart';
import 'package:srm_test/controllers/attendance/attendance_controller.dart';
import 'package:srm_test/models/attendance/attendance_expand.model.dart';
import 'package:srm_test/screens/attendance/showDialog.dart';

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
                               showDialog( builder: (BuildContext context) { return ShowDialog(httpService: httpService,student: student,);  }, context: context);
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
