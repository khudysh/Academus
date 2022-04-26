import 'package:flutter/material.dart';
import 'package:srm_test/studyCrm.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Eugene",
      home: StudyCrm(),
      debugShowCheckedModeBanner: false,
    );
  }
}


