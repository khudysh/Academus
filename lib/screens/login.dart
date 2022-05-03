import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    const Text("Welcome to the app, please log in"),
                    const TextField(
                        decoration: InputDecoration(labelText: "username")),
                    const TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "password")),
                    ElevatedButton(
                        child: const Text("Log in",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        })
                  ]),
            ),
          ));
    }));
  }
}
