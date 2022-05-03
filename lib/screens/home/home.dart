import 'package:flutter/material.dart';
import 'package:srm_test/screens/home/responsive_cards.dart';
import 'package:srm_test/resources/const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final standartPadding = 110.0;

  @override
  Widget build(BuildContext context) {
    final sizeOfScreen = MediaQuery.of(context).size.width;
    print("rebuild Home");
    if (sizeOfScreen > minDesktopSize + 167) { // sm size
      return Padding(
          padding: sizeOfScreen < minDesktopSize + 392 // md size
              ? const EdgeInsets.only(top: 0)
              : EdgeInsets.only(top: standartPadding),
          child: const ResponsiveCards());
    } else {
      return const SingleChildScrollView(child: ResponsiveCards());
    }
  }
}
