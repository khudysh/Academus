import 'package:flutter/material.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Align(
            alignment: Alignment.topCenter,
            //check if data is loaded, if loaded then show datalist on child
            child: Table(
              border: TableBorder.all(width: 2, color: Colors.black45),
              children: const [
                TableRow(children: [
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Дата занятия",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Тема",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Присутствие",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Оценка",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )),
                ])
              ],
            )));
  }
}
