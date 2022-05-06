import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/controllers/app/switch_body.dart';
import 'package:srm_test/resources/const.dart';



class TitleApp extends StatelessWidget{
  final Alignment align;
   const TitleApp({Key? key, this.align=Alignment.center}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("rebuild TitleApp");
    return  Align(alignment: align, child: Text(
              selectedItem[context.watch<CurrentScreen>().getCurrentScreenNum],
            ));
  }


}