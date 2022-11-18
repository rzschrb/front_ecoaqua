import 'dart:math';

import 'package:flutter/material.dart';

import 'package:front_ecoaqua/main.dart';

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
            Column(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  color: const Color.fromARGB(255, 182, 182, 182),
                  child: SizedBox(
                    width: 325,
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                child: Text('Dispositivo Teste',
                                    style: TextStyle(color: Colors.black, fontSize: 12.0))
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                                child: IconButton(onPressed: () {
                                  // Respond to button press
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const MyApp())
                                  );
                                },
                                    icon: const Icon(Icons.settings, color: Colors.black, size: 16,))
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
                        height: 100,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                    child: Text('Dispositivo Teste 1',
                                        style: TextStyle(color: Colors.white, fontSize: 12.0))
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                                    child: IconButton(onPressed: () {
                                      // Respond to button press
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => const MyApp())
                                      );
                                    },
                                        icon: const Icon(Icons.settings, color: Colors.white, size: 16,))
                                )
                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0, 0.0),
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
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}