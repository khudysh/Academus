// ignore_for_file: non_constant_identifier_names

class AttendanceStudentsData {
  String id, name, surname;

  AttendanceStudentsData({
    this.id = 'null_id',
    this.name = 'null_name',
    this.surname = 'null_surname',
  });
  //constructor

  factory AttendanceStudentsData.fromJSON(Map<String, dynamic> json) {
    return AttendanceStudentsData(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
    );
  }
}
