// ignore_for_file: non_constant_identifier_names

class StudentsData {
  String id, name, surname, title;

  StudentsData({
    this.id = 'null_id',
    this.name = 'null_name',
    this.surname = 'null_surname',
    this.title = 'null_title',
  });
  //constructor

  factory StudentsData.fromJSON(Map<String, dynamic> json) {
    return StudentsData(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
      title: json["title"],
    );
  }
}
