class NameOne{
    String? id, name, address, phone;

    NameOne({
        this.id,
        this.name,
        this.address,
        this.phone
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