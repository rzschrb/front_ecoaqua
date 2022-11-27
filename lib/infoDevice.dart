import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front_ecoaqua/devicesScreen.dart';

import 'package:front_ecoaqua/main.dart';

class InfoDevicePage extends StatelessWidget {
  const InfoDevicePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAqua Device Info Screen',
      theme: ThemeData(
        // This is the theme of your application.
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const InfoDeviceHome(title: 'EcoAqua Device Info Screen'),
    );
  }
}

class InfoDeviceHome extends StatefulWidget {
  const InfoDeviceHome({super.key, required this.title});

  final String title;

  @override
  State<InfoDeviceHome> createState() => _InfoDeviceHomeState();
}

class _InfoDeviceHomeState extends State<InfoDeviceHome> {
  var controlValve = const Color.fromARGB(255, 255, 0, 0);
  var textValve = "Fechar";
  var iconValve = Icons.lock;
  var statusWaterbox = "Normal";
  var statusColor = const Color.fromARGB(255, 18, 158, 87);
  bool valveState = true;

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const DevicesPage())
            );
          },
        ),
        title: const Text('Editando Dispositivo', style: TextStyle(color: Colors.white, fontSize: 24))
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 20),
                  child:
                  Text("Nome", style: TextStyle(color: Colors.white, fontSize: 20)
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 10.0),
                    child:
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Dispositivo',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 85.0, 10.0),
                    child: IconButton(
                        onPressed: () {
                      // Respond to button press
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const DevicesPage())
                      );
                    },
                        iconSize: 32,
                        icon: const Icon(Icons.edit_note, color: Colors.white),
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            backgroundColor: const Color.fromARGB(255, 0, 87, 255)
                        )
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 10),
                  child:
                  Text("Status", style: TextStyle(color: Colors.white, fontSize: 20)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 65, 10),
                  child:
                  Text("Válvula", style: TextStyle(color: Colors.white, fontSize: 20)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                  child:
                  Ink(
                    padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(statusWaterbox, style: const TextStyle(fontSize: 20, color: Colors.white)),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 20),
                  child:
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100.0,45.0),
                        backgroundColor: controlValve,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        setState(() {
                          valveState == true ? valveState = false : valveState = true;
                        });
                        if (valveState) {
                          controlValve = const Color.fromARGB(255, 255, 0, 0);
                          textValve = "Fechar";
                          iconValve = Icons.lock;
                          statusWaterbox = "Normal";
                          statusColor = const Color.fromARGB(255, 18, 158, 87);
                        } else {
                          controlValve = const Color.fromARGB(255, 18, 158, 87);
                          textValve = "Abrir";
                          iconValve = Icons.lock_open;
                          statusWaterbox = "Fechado";
                          statusColor = const Color.fromARGB(255, 255, 0, 0);
                        }
                      },
                      icon: Icon(iconValve, color: Colors.white),
                      label: Text(textValve, style: const TextStyle(fontSize: 20, color: Colors.white))
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 10),
                  child:
                  Text("Historico", style: TextStyle(color: Colors.white, fontSize: 20)
                  ),
                ),
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
                    height: 125,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                child: Text('Data 19/11/2022',
                                    style: TextStyle(color: Colors.black, fontSize: 14.0))
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
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 325,
                    height: 125,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                child: Text('Data 20/11/2022',
                                    style: TextStyle(color: Colors.black, fontSize: 14.0))
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
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 325,
                    height: 125,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                child: Text('Data 21/11/2022',
                                    style: TextStyle(color: Colors.black, fontSize: 14.0))
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
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 325,
                    height: 125,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                child: Text('Data 22/11/2022',
                                    style: TextStyle(color: Colors.black, fontSize: 14.0))
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
                    backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    // Respond to button press
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const DevicesPage())
                    );
                  },
                  child: const Text('Remover Dispositivo', style: TextStyle(color: Colors.white))
              ),
            ),
            ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
