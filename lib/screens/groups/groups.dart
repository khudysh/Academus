import 'package:flutter/material.dart';
import 'package:srm_test/models/groups/groups.model.dart';
import 'package:srm_test/screens/groups/showDialog.dart';
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
                                  return  ShowDialog(httpService: httpService,post: post,);
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
