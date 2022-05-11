import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/attendance/attendance.model.dart';
import 'package:srm_test/models/attendance/attendance_expand.model.dart';
import 'package:srm_test/models/attendance/attendance_popup.model.dart';

class HttpService {
  final String groupsURL = "http://94.103.188.48/test/groups.php";
  final String studentsURL = "http://94.103.188.48/test/groups_popup.php";
  final String attendanceURL = "http://94.103.188.48/test/attendance_popup.php";

  Future<List<AttendanceGroupsData>> getGroups() async {
    Response res = await get(Uri.parse(groupsURL));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<AttendanceGroupsData> groups =
          body['data'].map<AttendanceGroupsData>(
        (dynamic item) {
          print(item);
          return AttendanceGroupsData.fromJSON(item);
        },
      ).toList();

      return groups;
    } else {
      throw "Unable to retrieve groups.";
    }
  }

  Future<List<AttendanceStudentsData>> getStudents(String id) async {
    Response res = await post(Uri.parse(studentsURL), body: {'id': id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<AttendanceStudentsData> groups =
          body['data'].map<AttendanceStudentsData>(
        (dynamic item) {
          print(item);
          return AttendanceStudentsData.fromJSON(item);
        },
      ).toList();

      return groups;
    } else {
      throw "Unable to retrieve students.";
    }
  }

  Future<List<AttendancePopupData>> getAttendance(String id) async {
    Response res = await post(Uri.parse(studentsURL), body: {'id': id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<AttendancePopupData> attends =
          body['data'].map<AttendancePopupData>(
        (dynamic item) {
          print(item);
          return AttendancePopupData.fromJSON(item);
        },
      ).toList();

      return attends;
    } else {
      throw "Unable to retrieve students.";
    }
  }
}
