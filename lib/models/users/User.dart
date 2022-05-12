// ignore_for_file: non_constant_identifier_names

class UserData {
  String? id, username, name, surname, phone, stuff_id;

  UserData(
      {this.id,
      this.username,
      this.name,
      this.surname,
      this.phone,
      this.stuff_id});
  //constructor

  factory UserData.fromJSON(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      username: json["username"],
      name: json["name"],
      surname: json["surname"],
      phone: json["phone"],
      stuff_id: json["stuff_id"],
    );
  }
}
