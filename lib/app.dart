import 'package:flutter/material.dart';
import 'package:srm_test/settings/adaptive.dart';
import 'package:srm_test/widgets/mobile_view.dart';
import 'package:srm_test/widgets/desktop_view.dart';


class StudyCrm extends StatefulWidget {
  const StudyCrm({Key? key}) : super(key: key);

  @override
  State<StudyCrm> createState() => _StudyCrmState();
}

class _StudyCrmState extends State<StudyCrm> with RestorationMixin {
  final RestorableInt _selectedIndex = RestorableInt(0);

  @override
  String get restorationId => 'nav_rail';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedIndex, 'selected_index');
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

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