import 'package:flutter/material.dart';
import 'package:srm_test/settings/adaptive.dart';
import 'package:srm_test/widgets/mobile_view.dart';
import 'package:srm_test/widgets/desktop_view.dart';


class StudyCrm extends StatelessWidget{
   StudyCrm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) {
      return const DesktopView();
    } else {
      return const MobileView();
    }
  }


}