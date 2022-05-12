// ignore_for_file: non_constant_identifier_names

class AttendancePopupData {
  String attendance, lesson_date, topic, mark;

  AttendancePopupData({
    this.attendance = 'null_attendance',
    this.lesson_date = 'null_lesson_date',
    this.topic = 'null_topic',
    this.mark = 'null_mark',
  });
  //constructor

  factory AttendancePopupData.fromJSON(Map<String, dynamic> json) {
    return AttendancePopupData(
      attendance: json["attendance"],
      lesson_date: json["lesson_date"],
      topic: json["topic"],
      mark: json["mark"],
    );
  }
}
