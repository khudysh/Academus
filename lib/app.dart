import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/leading.dart';
import 'package:srm_test/controllers/switch_body.dart';
import 'package:srm_test/widgets/navigation.dart';
import 'package:srm_test/widgets/title.dart';
import 'resources/const.dart';
class StudyCrm extends StatelessWidget {
  const StudyCrm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild StudyCrm");
    final sizeOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            leading: sizeOfScreen < minDesktopSize ? null : const Leading(),
            leadingWidth: 100,
            actions: [Icon(Icons.person_rounded, size: 30,), Icon(Icons.exit_to_app, size: 30,)],
            title: sizeOfScreen < minDesktopSize
                ? const TitleApp(padding: 0)
                : const TitleApp(padding: 0)),
        drawer: sizeOfScreen < minDesktopSize
            ? const SizedBox(
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
                              children: const [
                                Navigation(groupAlign: -1,),
                                VerticalDivider(thickness: 1, width: 1),
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 200.0,
                            child:
                                context.watch<CurrentScreen>().getCurrentScreen)
                      ]))));
  }
}
