import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/leading.dart';
import 'package:srm_test/controllers/app/switch_body.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: sizeOfScreen < minDesktopSize ? null : const Leading(),
            leadingWidth: sizeOfScreen < minDesktopSize ? 56 : 100,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkResponse(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  child: const Icon(
                    Icons.account_circle_sharp,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkResponse(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Icon(
                    Icons.login,
                    size: 30,
                  ),
                ),
              ),
            ],
            title: sizeOfScreen < minDesktopSize
                ? const TitleApp(align: Alignment.center)
                : const TitleApp(align: Alignment.centerLeft)),
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
                                Navigation(
                                  groupAlign: -1,
                                ),
                                VerticalDivider(thickness: 1, width: 1),
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100.0,
                            child:
                                context.watch<CurrentScreen>().getCurrentScreen)
                      ]))));
  }
}
