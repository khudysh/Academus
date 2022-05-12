import 'package:flutter/material.dart';
import 'package:srm_test/models/students/student_popup.model.dart';
import 'package:srm_test/resources/theme.dart';

class ShowDialog extends StatelessWidget{
  final httpService;
  final student;
  //final builder;

  const ShowDialog({Key? key,required this.httpService, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return FutureBuilder(
                                    future: httpService.getPopup(student.id),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<StudentPopupData>>
                                            snapshot2) {
                                      print(snapshot2);
                                      if (snapshot2.hasData) {
                                        List<StudentPopupData> studentsPopup =
                                            snapshot2.data!;
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              vertical: 24),
                                          contentPadding: EdgeInsets.zero,
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: <Widget>[
                                              Positioned(
                                                right: -15.0,
                                                top: -15.0,
                                                child: InkResponse(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const CircleAvatar(
                                                    radius: 12,
                                                    child: Icon(
                                                      Icons.close_outlined,
                                                      size: 18,
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 60,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          color: CustomTheme
                                                              .lightTheme
                                                              .primaryColor
                                                              .withOpacity(0.8),
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3)))),
                                                      child: Center(
                                                          child: Text(
                                                              "${student.name} ${student.surname}",
                                                              style: TextStyle(
                                                                color: CustomTheme
                                                                    .lightTheme
                                                                    .colorScheme
                                                                    .onPrimary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ))),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.2))),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children:
                                                                  studentsPopup
                                                                      .map(
                                                                (StudentPopupData
                                                                    studentPopup) {
                                                                  return Column(
                                                                    children:[ Card(
                                                                      child: ListTile(
                                                                          title: Text(
                                                                              'Имя родителя:'),
                                                                              subtitle: Text(studentPopup.parent_name, style: TextStyle(fontSize: 18),)),
                                                                    ),
                                                                            Card(
                                                                              child: ListTile(
                                                                                                                                                    title: Text(
                                                                              'Телефон родителя:'),
                                                                              subtitle: Text(studentPopup.parent_phone, style: TextStyle(fontSize: 18),)),
                                                                            ),
                                                                            Card(
                                                                              child: ListTile(
                                                                                                                                                    title: Text(
                                                                              'Дополнительная информация:'),
                                                                              subtitle: Text(studentPopup.add_info, style: TextStyle(fontSize: 18),)),
                                                                            ),
                                                                    ]);
                                                                },
                                                              ).toList(),
                                                            ),
                                                          ),
                                                        )),
                                                  ]),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  );
 
  }
}