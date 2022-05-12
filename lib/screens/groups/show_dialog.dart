
import 'package:flutter/material.dart';
import 'package:srm_test/models/groups/groups_popup.model.dart';
import 'package:srm_test/resources/theme.dart';

class ShowDialog extends StatelessWidget{
  final dynamic httpService;
  final dynamic post;
  //final builder;

  const ShowDialog({Key? key,required this.httpService, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return FutureBuilder(
                                    future: httpService.getPopup(post.id),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<GroupPopupData>>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        List<GroupPopupData> posts =
                                            snapshot.data!;
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
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
                                                              post.title,
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
                                                        padding: const EdgeInsets.all(
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
                                                                  posts.map(
                                                                (GroupPopupData
                                                                    post) {
                                                                  return Card(
                                                                    child: ListTile(
                                                                        title: Text(
                                                                            '${post.name} ${post.surname}')),
                                                                  );
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
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  );
 
  }
}