import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/leading.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/widgets/navigation.dart';
import 'package:srm_test/widgets/title.dart';
import 'resources/const.dart';
class StudyCrm extends StatelessWidget {
  StudyCrm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild StudyCrm");
    final sizeOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            leading: sizeOfScreen < minDesktopSize ? null : Leading(),
            title: sizeOfScreen < minDesktopSize
                ? TitleApp(padding: 0)
                : TitleApp(padding: 25)),
        drawer: sizeOfScreen < minDesktopSize
            ? SizedBox(
                width: 125, child: Drawer(child: Navigation(groupAlign: -0.7)))
            : null,
        body: SafeArea(
            child: Center(
                child: sizeOfScreen < minDesktopSize
                    ? context.watch<CurrentScreen>().getCurrentScreen
                    : Row(children: [
                        SizedBox(
                            width: 100.0,
                            child: Row(
                              children: [
                                Navigation(),
                                const VerticalDivider(thickness: 1, width: 1),
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 200.0,
                            child:
                                context.watch<CurrentScreen>().getCurrentScreen)
                      ]))));
  }
}
