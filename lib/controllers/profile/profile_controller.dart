import 'dart:convert';
import 'package:http/http.dart';
import 'package:srm_test/models/users/user.dart';

class HttpService {

  final String userProfileURL = "http://94.103.188.48/test/profile.php";

  Future<List<UserData>> getUserData(String id) async {
    Response res = await post(Uri.parse(userProfileURL), body: {'id':id});

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<UserData> users = body['data'].map<UserData>(
        (dynamic item) {
          return UserData.fromJSON(item);
        },
      ).toList();

      return users;
    } else {
      throw "Unable to retrieve user.";
    }
  }
}
