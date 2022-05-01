import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/routes.dart';
import 'package:srm_test/resources/const.dart';

class TitleApp extends StatelessWidget{
  double padding;
   TitleApp({Key? key, this.padding=0}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("rebuild TitleApp");
    return Padding(
            padding: EdgeInsetsDirectional.only(start: padding),
            child: Text(
              selectedItem[context.watch<CurrentScreen>().getCurrentScreenNum],
            ));
  }


}