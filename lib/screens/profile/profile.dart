import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/controllers/app/switch_body.dart';
import 'package:srm_test/models/users/user.dart';
import 'package:srm_test/controllers/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final HttpService httpService = HttpService();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.lightGreen[200],
          padding: constraints.maxWidth < 500
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Ваш профиль"),
                    const CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://94.103.188.48:50/img/lambda.png'),
                        radius: 70,
                      ),
                    ),
                    FutureBuilder(
                      future: httpService.getUserData(
                          context.watch<CurrentScreen>().getUserId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<UserData>> snapshot) {
                        if (snapshot.hasData) {
                          List<UserData> userdatas = snapshot.data!;
                          return SingleChildScrollView(
                            child: ListView(
                              shrinkWrap: true,
                              children: userdatas.map((UserData user) {
                                return Column(children: [
                                  Card(
                                    color: Colors.grey[50],
                                    child: ListTile(
                                        title: const Text('Логин:'),
                                        subtitle: Text(
                                          user.username!,
                                          style: const TextStyle(fontSize: 18),
                                        )),
                                  ),
                                  Card(
                                    child: ListTile(
                                        title: const Text('Имя:'),
                                        subtitle: Text(
                                          "${user.name} ${user.surname}",
                                          style: const TextStyle(fontSize: 18),
                                        )),
                                  ),
                                  Card(
                                    color: Colors.grey[50],
                                    child: ListTile(
                                        title: const Text('Телефон:'),
                                        subtitle: Text(
                                          user.phone!,
                                          style: const TextStyle(fontSize: 18),
                                        )),
                                  ),
                                ]);
                              }).toList(),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    ElevatedButton(
                        child: const Text("Назад",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        })
                  ]),
            ),
          ));
    }));
  }
}
