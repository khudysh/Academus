import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import http package manually

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen>{
  late String errormsg;
  late bool error, showprogress;
  late String username, password;

  var _username = TextEditingController();
  var _password = TextEditingController();

  startLogin() async {
     String apiurl = "http://94.103.188.48/test/login.php"; //api url
     //dont use http://localhost , because emulator don't get that address
     //insted use your local IP address or use live URL
     //hit "ipconfig" in windows or "ip a" in linux to get you local IP
     print(username);

     var response = await http.post(Uri.parse(apiurl), body: {
        'username': username, //get the username text
        'password': password  //get password text
     });
       
     if(response.statusCode == 200){
         var jsondata = json.decode(response.body);
         if(jsondata["error"]){
             setState(() {
                 showprogress = false; //don't show progress indicator
                 error = true;
                 errormsg = jsondata["message"];
             });
         }else{
            if(jsondata["success"]){
               setState(() {
                  error = false;
                  showprogress = false;
                  Navigator.pushReplacementNamed(context, '/home');
               });
               //save the data returned from server
               //and navigate to home page
               String id = jsondata["id"];
               print(id);
               //user shared preference to save data
            }else{
               showprogress = false; //don't show progress indicator
               error = true;
               errormsg = "Something went wrong.";
            }  
         }
     }else{
        setState(() {
           showprogress = false; //don't show progress indicator
           error = true;
           errormsg = "Error during connecting to server.";
        });
     }
  }

  @override
  void initState() {
     username = "";
     password = "";
     errormsg = "";
     error = false;
     showprogress = false;

     //_username.text = "defaulttext";
     //_password.text = "defaultpassword";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.lightGreen[200],
          padding: constraints.maxWidth < 500
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top:80),
                        child: Text("Sign Into System", style: TextStyle( 
                            color:Colors.white,fontSize: 40, fontWeight: FontWeight.bold
                        ),), //title text
                     ),

                     Container(
                        margin: EdgeInsets.only(top:10),
                        child: Text("Sign In using Email and Password", style: TextStyle( 
                            color:Colors.white,fontSize: 15
                        ),), //subtitle text
                     ),
                    Container( 
                         //show error message here
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:error? errmsg(errormsg):Container(),
                         //if error == true then show error message
                         //else set empty container as child
                     ),
                    Container( 
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                        margin: EdgeInsets.only(top:10),
                        child: TextField(
                          controller: _username, //set username controller
                          style:TextStyle(color:Colors.orange[100], fontSize:20),
                          decoration: myInputDecoration(
                              label: "Username",
                              icon: Icons.person,
                          ),
                           onChanged: (value){
                            //set username  text on change
                             username = value;
                          },
                            
                        ),
                     ),

                     Container( 
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _password, //set password controller
                          style: TextStyle(color:Colors.orange[100], fontSize:20),
                          obscureText: true,
                          decoration: myInputDecoration(
                              label: "Password",
                              icon: Icons.lock,
                          ),
                          onChanged: (value){
                             // change password text
                             password = value;
                          },
                            
                        ),
                     ),
                    ElevatedButton(
                        child: showprogress? 
                                       SizedBox( 
                                         height:30, width:30,
                                         child: CircularProgressIndicator(
                                           backgroundColor: Colors.orange[100],
                                           valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                                         ),
                                       ):Text("LOGIN NOW", style: TextStyle(fontSize: 20),),
                                       // if showprogress == true then show progress indicator 
                                       // else show "LOGIN NOW" text
                        onPressed: () {
                          setState(() {
                                        //show progress indicator on click
                                        showprogress = true;
                                     });
                                     startLogin();
                        })
                  ]),
            ),
          ));
    }));
  }
  InputDecoration myInputDecoration({String? label, IconData? icon}){
     return InputDecoration( 
         hintText: label, //show label as placeholder
         hintStyle: TextStyle(color:Colors.orange[100], fontSize:20), //hint text style
         prefixIcon: Padding(
                         padding: EdgeInsets.only(left:20, right:10),
                         child:Icon(icon, color: Colors.orange[100],)
                         //padding and icon for prefix
                      ),
         
         contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
         enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color:Colors.orange[300]!, width: 1)
         ), //default border of input

         focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color:Colors.orange[200]!, width: 1)
         ), //focus border 

         fillColor: Color.fromRGBO(251,140,0, 0.5),
         filled: true, //set true if you want to show input background
     );
  }

  Widget errmsg(String text){
  //error message widget.
        return Container(
            padding: EdgeInsets.all(15.00),
            margin: EdgeInsets.only(bottom: 10.00),
            decoration: BoxDecoration( 
               borderRadius: BorderRadius.circular(30),
               color: Colors.red,
               border: Border.all(color:Colors.red[300]!, width:2)
            ),
            child: Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right:6.00),
                    child: Icon(Icons.info, color: Colors.white),
                ), // icon for error message
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
                //show error message text
            ]),
        );
  }
}