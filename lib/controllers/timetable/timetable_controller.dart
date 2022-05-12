import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/timetable/timetable.model.dart';

class HttpService {
  final String timetableURL = "http://94.103.188.48/test/timetable.php";
  //final String studentsURL = "http://94.103.188.48/test/groups_popup.php";

  Future<List<TimeTableData>> getTimeTable() async {
    Response res = await get(Uri.parse(timetableURL));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<TimeTableData> timetable = body['data'].map<TimeTableData>(
        (dynamic item) {
          return TimeTableData.fromJson(item);
        },
      ).toList();

      return timetable;
    } else {
      throw "Unable to retrieve timetable.";
    }
  }

  // Future<List<GroupPopupData>> getPopup(String id) async {
  //   Response res = await post(Uri.parse(studentsURL), body: {'id':id});

  //   if (res.statusCode == 200) {
  //     var body = jsonDecode(res.body);

  //     List<GroupPopupData> timetable = body['data'].map<GroupPopupData>(
  //       (dynamic item) {
  //         print(item);
  //         return GroupPopupData.fromJson(item);
  //       },
  //     ).toList();

  //     return timetable;
  //   } else {
  //     throw "Unable to retrieve students.";
  //   }
  // }
}
