class NameOne{
    String id, name, address, phone;

    NameOne({
        this.id='null_id',
        this.name='null_name',
        this.address='null_address',
        this.phone='null_phone'
    });
    //constructor

    factory NameOne.fromJSON(Map<String, dynamic> json){
        return NameOne( 
           id: json["id"],
           name: json["name"],
           address: json["address"],
           phone: json["phone"]
        );
    }
}