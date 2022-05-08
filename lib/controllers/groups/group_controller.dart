import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/groups/groups.model.dart';
import 'package:srm_test/models/groups/groups_popup.model.dart';

class HttpService {
  final String postsURL = "http://94.103.188.48/test/groups.php";
  final String studentsURL = "http://94.103.188.48/test/groups_popup.php";

  Future<List<GroupData>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<GroupData> posts = body['data'].map<GroupData>(
        (dynamic item) {
          print(item);
          return GroupData.fromJson(item);
        },
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<GroupPopupData>> getPopup(String id) async {
    Response res = await post(Uri.parse(studentsURL), body: {'id':id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<GroupPopupData> posts = body['data'].map<GroupPopupData>(
        (dynamic item) {
          print(item);
          return GroupPopupData.fromJson(item);
        },
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve students.";
    }
  }
}
