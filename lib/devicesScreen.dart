import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:front_ecoaqua/main.dart';
import 'package:front_ecoaqua/infoDevice.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAqua Devices Screen',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const DevicesHome(title: 'EcoAqua Devices Screen'),
    );
  }
}

class DevicesHome extends StatefulWidget {
  const DevicesHome({super.key, required this.title});

  final String title;

  @override
  State<DevicesHome> createState() => _DevicesHomeState();
}

class _DevicesHomeState extends State<DevicesHome> {
  bool deviceOne = true;
  bool deviceTwo = true;
  static String _deviceOneSwitch = "Aberta";
  static String _deviceTwoSwitch = "Aberta";

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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 35.0, 60.0, 10.0),
                  child: Text(
                      'Olá Ricardo',
                      style: TextStyle(color: Colors.white, fontSize: 24)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60.0, 35.0, 0.0, 10.0),
                  child: IconButton(onPressed: () {
                    // Respond to button press
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MyApp())
                    );
                  },
                      icon: const Icon(Icons.person, color: Colors.white))
                )
              ],
            ),
            Expanded(child:
              ListView(
                padding: const EdgeInsets.fromLTRB(32.0,0.0,32.0,0.0),
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: SizedBox(
                      width: 325,
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                  child: Text('Dispositivo Teste',
                                      style: TextStyle(color: Colors.black, fontSize: 14.0))
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                                  child: IconButton(onPressed: () {
                                    // Respond to button press
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => const InfoDevicePage())
                                    );
                                  },
                                      icon: const Icon(Icons.settings, color: Colors.black, size: 16,))
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                child: (
                                  Text("Output 1",
                                      style: TextStyle(color: Colors.black, fontSize: 12.0))
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                child: (
                                    Text("Output 2",
                                        style: TextStyle(color: Colors.black, fontSize: 12.0))
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: (
                                    CupertinoSwitch(value: deviceOne, onChanged: (bool value) {
                                      setState(() {
                                        deviceOne = value;
                                        if (deviceOne) {
                                          const snackBar = SnackBar(
                                            content: Text("Válvula aberta!"),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          _deviceOneSwitch = "Aberta";
                                        } else {
                                          const snackBar = SnackBar(
                                            content: Text("Válvula fechada!"),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          _deviceOneSwitch = "Fechada";
                                        }
                                      });
                                    }
                                    )
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: (
                                    Text(_deviceOneSwitch)
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    color: const Color.fromARGB(255, 20, 22, 28),
                    child: SizedBox(
                      width: 325,
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                  child: Text('Dispositivo Teste 1',
                                      style: TextStyle(color: Colors.white, fontSize: 14.0))
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                                  child: IconButton(onPressed: () {
                                    // Respond to button press
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => const InfoDevicePage())
                                    );
                                  },
                                      icon: const Icon(Icons.settings, color: Colors.white, size: 16,))
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                child: (
                                    Text("Output 1",
                                        style: TextStyle(color: Colors.white, fontSize: 12.0))
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                child: (
                                    Text("Output 2",
                                        style: TextStyle(color: Colors.white, fontSize: 12.0))
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: (
                                    CupertinoSwitch(value: deviceTwo, onChanged: (bool value) {
                                      setState(() {
                                        deviceTwo = value;
                                        if (deviceTwo) {
                                          const snackBar = SnackBar(
                                            content: Text("Válvula aberta!"),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          _deviceTwoSwitch = "Aberta";
                                        } else {
                                          const snackBar = SnackBar(
                                            content: Text("Válvula fechada!"),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          _deviceTwoSwitch = "Fechada";
                                        }
                                      });
                                    }
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: (
                                    Text(_deviceTwoSwitch,
                                    style: const TextStyle(color: Colors.white))
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0, 20.0),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100.0,45.0),
                    backgroundColor: const Color.fromARGB(255, 0, 87, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    // Respond to button press
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MyApp())
                    );
                  },
                  child: const Text('New Device')
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
