import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srm_test/controllers/switch_body.dart';

class Leading extends StatelessWidget{
   const Leading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("rebuild Leading");
    return  InkWell(
            splashColor: const Color.fromARGB(0, 0, 0, 0),
            onTap: () {
              context.read<CurrentScreen>().switchBody(0);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15),
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
          
        );
  }


}