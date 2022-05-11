// ignore_for_file: non_constant_identifier_names

class AttendancePopupData {
  String id, name, surname;

  AttendancePopupData({
    this.id = 'null_id',
    this.name = 'null_name',
    this.surname = 'null_surname',
  });
  //constructor

  factory AttendancePopupData.fromJSON(Map<String, dynamic> json) {
    return AttendancePopupData(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
    );
  }
}
