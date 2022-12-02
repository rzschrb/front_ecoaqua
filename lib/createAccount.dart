import 'dart:ffi' as ffi;

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:front_ecoaqua/main.dart';
import 'package:front_ecoaqua/devicesScreen.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAqua Create Account',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const CreateAccountHome(title: 'EcoAqua Create Account'),
    );
  }
}

class CreateAccountHome extends StatefulWidget {
  const CreateAccountHome({super.key, required this.title});

  final String title;

  @override
  State<CreateAccountHome> createState() => _CreateAccountHomeState();
}

class _CreateAccountHomeState extends State<CreateAccountHome> {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future<String> setStatusClosed(String id) async {
    final response = await http
        .post(Uri.parse('http://192.168.0.6:8080/influxIOT/waterbox/close'),body: "{\"id\" : \"${id}\"}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return "true";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return "false";
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 6, 12),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 10.0),
              child:
              Text(
                  'Create account.',
                  style: TextStyle(color: Colors.white, fontSize: 32)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
              child:
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle, color: Colors.white),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 87, 255), width: 1.5)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 10.0),
              child:
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 87, 255), width: 1.5)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 10.0),
              child:
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key, color: Colors.white),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 87, 255), width: 1.5)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 10.0),
              child:
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key, color: Colors.white),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 87, 255), width: 1.5)
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 10.0),
                child:
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100.0,45.0),
                      backgroundColor: const Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      print(Text(usernameController.text));
                      print(Text(emailController.text));
                      print(Text(passwordController.text));
                      if (setStatusClosed(usernameController.text) == "true")
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const DevicesPage())
                      );
                    },
                    child: const Text('Sign Up')
                ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:
                InkWell(
                  child: const Text('Already have an account. Log In', style: (TextStyle( color: Colors.white, fontSize: 12))),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MyApp())
                    );
                  },
                )
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
