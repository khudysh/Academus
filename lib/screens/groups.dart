import 'package:flutter/material.dart';
import 'package:srm_test/models/groups/groups.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  bool error = false, dataloaded = false;
  var data;
  String dataurl = "http://94.103.188.48/test/index.php"; //PHP script URL
  // do not use http://localhost/ for your local
  // machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or 
  // "ip a" on Linux to get IP Address

  @override
  void initState() {
    loaddata();
    //calling loading of data 
    super.initState();
  }

  void loaddata(){
    Future.delayed(Duration.zero,() async {
        var res = await http.post(Uri.parse(dataurl));
        if (res.statusCode == 200) {
            setState(() {
                data = json.decode(res.body);
                dataloaded = true;
                // we set dataloaded to true,
                // so that we can build a list only
                // on data load
            });
        }else{
           //there is error
           setState(() {
               error = true;
           });
        }
    });
    // we use Future.delayed becuase there is 
    // async function inside it. 
  }


  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
              alignment: Alignment.topCenter,
              //check if data is loaded, if loaded then show datalist on child
              child:dataloaded?datalist(): 
              const Center( //if data is not loaded then show progress
                child:CircularProgressIndicator()
              ),

       ),
    );
  }

  Widget datalist(){
    if(data["error"]){
       return Text(data["errmsg"]); 
       //print error message from server if there is any error
    }else{
      List<GroupData> grouplist = List<GroupData>.from(data["data"].map((i){
            return GroupData.fromJSON(i);
          })
       ); //prasing data list to model

    return Column(  //if everything fine, show the JSON as widget
                  children:grouplist.map((GroupData){
                      return Card(
                         child: ListTile(
                               title: Text(GroupData.title),
                               subtitle: Text("${GroupData.day} ${GroupData.time_interval}\t${GroupData.name} ${GroupData.surname}"),
                         ),
                      );

    // Table( //if data is loaded then show table
    //         border: TableBorder.all(width:1, color:Colors.black45),
    //         children: titlelist.map((GroupData){
    //            return TableRow( //return table row in every loop
    //                   children: [
    //                      //table cells inside table row
    //                       TableCell(child: Padding( 
    //                           padding: EdgeInsets.all(5),
    //                           child:Text(GroupData.id)
    //                         )
    //                       ),
    //                       TableCell(child: Padding( 
    //                           padding: EdgeInsets.all(5),
    //                           child:Text(GroupData.title)
    //                         )
    //                       ),
    //                   ]
    //             );
            }).toList(),
        );  
    }
  }
}