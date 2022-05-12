import 'package:flutter/material.dart';
import 'package:srm_test/models/students/student.model.dart';
import 'package:srm_test/screens/students/show_dialog.dart';
import 'package:srm_test/controllers/students/students_controller.dart';


class Students extends StatelessWidget {
  final HttpService httpService = HttpService();

  Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.topCenter,
        //check if data is loaded, if loaded then show datalist on child
        child: FutureBuilder(
          future: httpService.getStudents(),
          builder: (BuildContext context,
              AsyncSnapshot<List<StudentsData>> snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              List<StudentsData> students = snapshot.data!;
              return ListView(
                children: students
                    .map(
                      (StudentsData student) => Card(
                        child: ListTile(
                          title: Text("${student.name} ${student.surname}"),
                          subtitle: Text("${student.title} "),
                          trailing: const Icon(Icons.info_outline),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ShowDialog(httpService: httpService,student: student,);
                                });
                          },
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
