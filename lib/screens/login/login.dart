import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:srm_test/controllers/app/switch_body.dart';
import 'package:srm_test/screens/login/login_errmsg.dart';
import 'package:srm_test/screens/login/login_input_decoration.dart';
//import http package manually

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  late String errormsg;
  late bool error, showprogress;
  late String username, password;

  final _username = TextEditingController();
  final _password = TextEditingController();

  startLogin() async {
    String apiurl = "http://94.103.188.48:50/login.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    print(username);

    var response = await http.post(Uri.parse(apiurl), body: {
      'username': username, //get the username text
      'password': password //get password text
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = jsondata["message"];
        });
      } else {
        if (jsondata["success"]) {
          String id = jsondata["id"];
          print(id);
          setState(() {
            error = false;
            showprogress = false;
            context.read<CurrentScreen>().saveUser(id);
           Navigator.of(context)
    .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
          });
          //save the data returned from server
          //and navigate to home page

          //user shared preference to save data
        } else {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = "Что-то пошло не так.";
        }
      }
    } else {
      setState(() {
        showprogress = false; //don't show progress indicator
        error = true;
        errormsg = "Ошибка при попытке подключиться к серверу.";
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
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: Text(
                          "Вход в систему",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), //title text
                      ),
                      Text(
                        "Войдите используя пароль и логин",
                        style: TextStyle(color: Colors.grey[900], fontSize: 15),
                      ),
                      Container(
                        //show error message here
                        margin: const EdgeInsets.only(top: 150),
                        padding: const EdgeInsets.all(10),
                        child: error ? ErrMsg(text: errormsg) : Container(),
                        //if error == true then show error message
                        //else set empty container as child
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        margin: const EdgeInsets.only(top: 50),
                        child: TextField(
                          controller: _username, //set username controller
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 20),
                          decoration: InputDecorationLogin.myInputDecoration(
                            label: "Логин",
                            icon: Icons.person,
                          ),
                          onChanged: (value) {
                            //set username  text on change
                            username = value;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: _password, //set password controller
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 20),
                          obscureText: true,
                          decoration: InputDecorationLogin.myInputDecoration(
                            label: "Пароль",
                            icon: Icons.lock,
                          ),
                          onChanged: (value) {
                            // change password text
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: ElevatedButton(
                            child: showprogress
                                ? SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.orange[100],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.deepOrangeAccent),
                                    ),
                                  )
                                : const Text(
                                    "Войти",
                                    style: TextStyle(fontSize: 20),
                                  ),
                            // if showprogress == true then show progress indicator
                            // else show "LOGIN NOW" text
                            onPressed: () {
                              setState(() {
                                //show progress indicator on click
                                showprogress = true;
                              });
                              startLogin();
                            }),
                      )
                    ]),
              ),
            ),
          ));
    }));
  }




}
