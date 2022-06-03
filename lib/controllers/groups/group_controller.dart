import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/groups/groups.model.dart';
import 'package:srm_test/models/groups/groups_popup.model.dart';

class HttpService {
  final String groupsURL = "http://94.103.188.48:50/groups.php";
  final String studentsURL = "http://94.103.188.48:50/groups_popup.php";

  Future<List<GroupData>> getGroups() async {
    Response res = await get(Uri.parse(groupsURL));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<GroupData> groups = body['data'].map<GroupData>(
        (dynamic item) {
          return GroupData.fromJson(item);
        },
      ).toList();

      return groups;
    } else {
      throw "Unable to retrieve groups.";
    }
  }

  Future<List<GroupPopupData>> getPopup(String id) async {
    Response res = await post(Uri.parse(studentsURL), body: {'id': id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<GroupPopupData> students = body['data'].map<GroupPopupData>(
        (dynamic item) {
          return GroupPopupData.fromJson(item);
        },
      ).toList();

      return students;
    } else {
      throw "Unable to retrieve students.";
    }
  }
}
