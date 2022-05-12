// ignore_for_file: non_constant_identifier_names

class StudentPopupData {
  String parent_phone, parent_name, add_info;

  StudentPopupData({
    this.parent_phone = 'null_parent_phone',
    this.add_info = 'null_add_info',
    this.parent_name = 'null_parent_name',
  });
  //constructor

  factory StudentPopupData.fromJSON(Map<String, dynamic> json) {
    return StudentPopupData(
      parent_phone: json["parent_phone"],
      parent_name: json["parent_name"],
      add_info: json["add_info"],
    );
  }
}
