class AttendanceGroupsData {
  String title, day, time_interval, name, surname, id;

  AttendanceGroupsData({
    this.id = 'null_id',
    this.day = 'null_day',
    this.title = 'null_title',
    this.time_interval = 'null_time_interval',
    this.name = 'null_name',
    this.surname = 'null_surname',
  });
  //constructor

  factory AttendanceGroupsData.fromJSON(Map<String, dynamic> json) {
    return AttendanceGroupsData(
      id: json["id"],
      title: json["title"],
      day: json["day"],
      time_interval: json["time_interval"],
      name: json["name"],
      surname: json["surname"],
    );
  }
}
