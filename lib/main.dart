import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/app.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/controllers/app/switch_body.dart';
import 'package:srm_test/screens/login.dart';
import 'package:srm_test/screens/profile/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild MainApp");

    return ChangeNotifierProvider<CurrentScreen>(
      create: (context) => CurrentScreen(),
      child: MaterialApp(
          title: "Eugene",
          home: const StudyCrm(),
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          initialRoute: "/login",
          routes: {
            "/home": (context) {
              Future.delayed(Duration.zero, () {
                context.read<CurrentScreen>().switchBody(0);
              });
              return const StudyCrm();
            },
            "/timetable": (context) {
              Future.delayed(Duration.zero, () {
                context.read<CurrentScreen>().switchBody(1);
              });
              return const StudyCrm();
            },
            "/register": (context) {
              Future.delayed(Duration.zero, () {
                context.read<CurrentScreen>().switchBody(2);
              });
              return const StudyCrm();
            },
            "/groups": (context) {
              Future.delayed(Duration.zero, () {
                context.read<CurrentScreen>().switchBody(3);
              });
              return const StudyCrm();
            },
            "/students": (context) {
              Future.delayed(Duration.zero, () {
                context.read<CurrentScreen>().switchBody(4);
              });
              return const StudyCrm();
            },
            "/login": (context) {
              return LoginScreen();
            },
             "/profile": (context) {
              return ProfileScreen();
            },
          }
          ),
    );
  }
}
