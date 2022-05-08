import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/students/student.model.dart';
import 'package:srm_test/models/students/student_popup.model.dart';

class HttpService {
  final String studentsURL = "http://94.103.188.48/test/students.php";
  final String studentsPopupURL = "http://94.103.188.48/test/students_popup.php";

  Future<List<StudentsData>> getStudents() async {
    Response res = await get(Uri.parse(studentsURL));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<StudentsData> posts = body['data'].map<StudentsData>(
        (dynamic item) {
          print(item);
          return StudentsData.fromJSON(item);
        },
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<StudentPopupData>> getPopup(String id) async {
    Response res = await post(Uri.parse(studentsPopupURL), body: {'id':id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<StudentPopupData> posts = body['data'].map<StudentPopupData>(
        (dynamic item) {
          print(item);
          return StudentPopupData.fromJSON(item);
        },
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve students.";
    }
  }
}
