import 'package:flutter/material.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/controllers/timetable/timetable_controller.dart';

class TimeTableHeader extends StatelessWidget {
  final HttpService httpService = HttpService();

  TimeTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(221, 214, 40, 40),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.0),
          topRight: Radius.circular(19.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Группа",
                              style: timeTableHeaderTextTheme
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Преподаватель",
                            style: timeTableHeaderTextTheme
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Дата",
                            style: timeTableHeaderTextTheme
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Аудитория",
                          style: timeTableHeaderTextTheme
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
