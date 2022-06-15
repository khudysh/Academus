import 'package:flutter/material.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/models/timetable/timetable.model.dart';
import 'package:srm_test/controllers/timetable/timetable_controller.dart';
import 'package:srm_test/screens/timetable/timetable_header.dart';

class TimeTable extends StatelessWidget {
  final HttpService httpService = HttpService();

  TimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Align(
            alignment: Alignment.topCenter,
            //check if data is loaded, if loaded then show datalist on child
            child: Column(children: [
              Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: Column(children: [
                    TimeTableHeader(),
                    FutureBuilder(
                      future: httpService.getTimeTable(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TimeTableData>> snapshot) {
                        print(snapshot);
                        if (snapshot.hasData) {
                          List<TimeTableData> students = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: students
                                .map(
                                  (TimeTableData student) => Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    student.title
                                                            .split('-')[0] +
                                                        ' - ' +
                                                        student.title
                                                            .split('-')[1],
                                                    style: timeTableMainTextTheme
                                                  ),
                                                  Text(
                                                    student.title.split('-')[2],
                                                    style: timeTableSecondTextTheme
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    student.name +
                                                        ' ' +
                                                        student.surname,
                                                    style: timeTableMainTextTheme
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    student.day,
                                                    style: timeTableMainTextTheme
                                                  ),
                                                  Text(
                                                    student.time_interval,
                                                    style: timeTableSecondTextTheme
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: ListTile(
                                            title: Text(
                                              student.auditorium
                                                  .substring(0, 5),
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                background: Paint()
                                                  ..color = Colors.red[100]!
                                                  ..strokeWidth = 30
                                                  ..strokeJoin =
                                                      StrokeJoin.round
                                                  ..strokeCap = StrokeCap.round
                                                  ..style =
                                                      PaintingStyle.stroke,
                                              ),
                                            ),
                                            trailing: const Icon(
                                                Icons.more_vert_rounded),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ])),
            ])));
  }
}
