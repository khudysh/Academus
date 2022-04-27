import 'package:flutter/material.dart';
import 'package:srm_test/app.dart';
import 'package:srm_test/resources/theme.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Eugene",
      home: const StudyCrm(),
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
    );
  }
}


