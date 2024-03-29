import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_ecoaqua/devicesScreen.dart';

import 'package:http/http.dart' as http;
import 'models/Customer.dart';

import 'createAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAqua Sign In',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro'
      ),
      home: const MyHomePage(title: 'EcoAqua Sign In Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                'Sign in.',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
              child:
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle, color: Colors.white),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100.0,45.0),
                      backgroundColor: const Color.fromARGB(255, 0, 87, 255),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                      onPressed: () {
                        if (Customer.login(emailController.text,passwordController.text).toString()!="true"){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => const DevicesPage())
                          );
                        }
                      },
                      child: const Text('Sign In')
                  ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child:
              InkWell(
                child: const Text('Create new account', style: (TextStyle( color: Colors.white, fontSize: 12))),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const CreateAccountPage())
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
