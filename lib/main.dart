import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/app.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/widgets/switch_body.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentScreen>(
      create: (context) => CurrentScreen(),
      child: MaterialApp(
        title: "Eugene",
        home: StudyCrm(),
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}


