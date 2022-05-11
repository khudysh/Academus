import 'package:flutter/material.dart';
import 'package:srm_test/models/groups/groups.model.dart';
import 'package:srm_test/models/groups/groups_popup.model.dart';
import 'package:srm_test/resources/theme.dart';
import 'package:srm_test/controllers/groups/group_controller.dart';

class Groups extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.topCenter,
        //check if data is loaded, if loaded then show datalist on child
        child: FutureBuilder(
          future: httpService.getGroups(),
          builder:
              (BuildContext context, AsyncSnapshot<List<GroupData>> snapshot) {
            if (snapshot.hasData) {
              List<GroupData> posts = snapshot.data!;
              return ListView(
                children: posts
                    .map(
                      (GroupData post) => Card(
                        child: ListTile(
                          title: Text(post.title),
                          subtitle: Text(
                              "${post.name} ${post.surname} \t${post.day} ${post.time_interval}\t"),
                          trailing: const Icon(Icons.info_outline),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
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
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.all(20.0),
                                              //   child: RaisedButton(
                                              //     padding: EdgeInsets.zero,
                                              //     child: Container(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //               .size
                                              //               .width,
                                              //       height: 60,
                                              //       decoration:
                                              //           const BoxDecoration(
                                              //               gradient: LinearGradient(
                                              //                   begin: Alignment
                                              //                       .topCenter,
                                              //                   end: Alignment
                                              //                       .bottomCenter,
                                              //                   colors: [
                                              //             Color(0xffc9880b),
                                              //             Color(0xfff77f00),
                                              //           ])),
                                              //       child: const Center(
                                              //           child: Text(
                                              //         "Submit",
                                              //         style: TextStyle(
                                              //             color: Colors.white70,
                                              //             fontSize: 20,
                                              //             fontWeight:
                                              //                 FontWeight.w800),
                                              //       )),
                                              //     ),
                                              //     onPressed: () {
                                              //       print("some pressed");
                                              //     },
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
