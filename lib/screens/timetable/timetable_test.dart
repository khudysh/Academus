import 'package:flutter/material.dart';
import 'package:srm_test/models/timetable/timetable.model.dart';
//import 'package:srm_test/models/groups/groups_popup.model.dart';
import 'package:srm_test/controllers/timetable/timetable_controller.dart';
import 'package:srm_test/screens/timetable/timetable_header.dart';

class TimeTableTest extends StatelessWidget {
  final HttpService httpService = HttpService();

  TimeTableTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Align(
            alignment: Alignment.topCenter,
            //check if data is loaded, if loaded then show datalist on child
            child: Column(
              children: [
                TimeTableHeader(),
                Card(
                child: FutureBuilder(
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
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                                student.title.split('-')[0] +
                                                    ' - ' +
                                                    student.title.split('-')[1],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
                                              Text(
                                                student.title.split('-')[2],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0),
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
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
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
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
                                              Text(
                                                student.time_interval,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              student.auditorium.substring(0, 5),
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                background: Paint()
                                                  ..color = Colors.red[100]!
                                                  ..strokeWidth = 30
                                                  ..strokeJoin = StrokeJoin.round
                                                  ..strokeCap = StrokeCap.round
                                                  ..style = PaintingStyle.stroke,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(Icons.more_vert_rounded)
                                        ]),
                                  ]),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ])));
  }
}
