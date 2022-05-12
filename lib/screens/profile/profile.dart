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
                    const Text("Welcome to your own profile"),
                    const CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "data:image/jpeg;base64,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"),
                        radius: 70,
                      ),
                    ),
                    FutureBuilder(
                      future: httpService.getUserData(context.watch<CurrentScreen>().getUserId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<UserData>> snapshot) {
                        if (snapshot.hasData) {
                          List<UserData> userdatas = snapshot.data!;
                          return SingleChildScrollView(
                            child: ListView(
                              shrinkWrap: true,
                              children: userdatas.map((UserData user) {
                                return Column(children: [
                                  Card(color: Colors.grey[50],
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
                                  Card(color: Colors.grey[50],
                                    child: ListTile(
                                        title: const Text(
                                            'Телефон:'),
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
                        child: const Text("Go back",
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
