class GroupPopupData{
    String name, surname, id;

    GroupPopupData({
        this.id='null_id',
        this.name='null_name',
        this.surname='null_surname',
    });
    //constructor

  factory GroupPopupData.fromJson(Map<String, dynamic> json) {
    return GroupPopupData(
            id: json['id'] as String,
            name: json['name'] as String,
            surname: json['surname'] as String,
    );
    }
}