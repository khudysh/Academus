import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/app.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/routes.dart';

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
          home: StudyCrm(),
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          // initialRoute: "/home",
          // routes: {
          //   "/home": (context) {
          //     Future.delayed(Duration.zero, () {
          //       context.read<CurrentScreen>().switchBody(0);
          //     });
          //     return StudyCrm();
          //   },
          //   "/timetable": (context) {
          //     Future.delayed(Duration.zero, () {
          //       context.read<CurrentScreen>().switchBody(1);
          //     });
          //     return StudyCrm();
          //   },
          //   "/register": (context) {
          //     Future.delayed(Duration.zero, () {
          //       context.read<CurrentScreen>().switchBody(2);
          //     });
          //     return StudyCrm();
          //   },
          //   "/groups": (context) {
          //     Future.delayed(Duration.zero, () {
          //       context.read<CurrentScreen>().switchBody(3);
          //     });
          //     return StudyCrm();
          //   },
          //   "/students": (context) {
          //     Future.delayed(Duration.zero, () {
          //       context.read<CurrentScreen>().switchBody(4);
          //     });
          //     return StudyCrm();
          //   }
          // }
          ),
    );
  }
}
