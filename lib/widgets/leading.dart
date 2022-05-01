import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/widgets/switch_body.dart';
import 'package:srm_test/routes.dart';
import 'package:srm_test/resources/const.dart';

class Leading extends StatelessWidget{
  final groupAlign;
   Leading({Key? key, this.groupAlign}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("rebuild Leading");
    return OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: InkWell(
            splashColor: const Color.fromARGB(0, 0, 0, 0),
            onTap: () {
              context.read<CurrentScreen>().switchBody(0);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: Row(
                children: const [
                  Text(
                    'A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.school_sharp,
                    size: 40,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 5),
                    child: Text(
                      'S',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }


}