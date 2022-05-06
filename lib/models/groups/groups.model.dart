class GroupData{
    String title, day, time_interval, name, surname;

    GroupData({
        this.day='null_day',
        this.title='null_title',
        this.time_interval='null_time_interval',
        this.name='null_name',
        this.surname='null_surname',
    });
    //constructor

    factory GroupData.fromJSON(Map<String, dynamic> json){
        return GroupData(
           title: json["title"],
           day: json["day"],
           time_interval: json["time_interval"],
           name: json["name"],
           surname: json["surname"],
        );
    }
}