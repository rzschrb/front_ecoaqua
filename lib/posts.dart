import 'package:flutter/material.dart';
import 'http_service.dart';
import 'card_model.dart';
import 'infoDevice.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  PostsPage({super.key});

  bool deviceOne = true;
  static String _deviceOneSwitch = "Aberta";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) =>  Card(
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
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                    child: Text(post.title,
                                        style: const TextStyle(color: Colors.black, fontSize: 14.0))
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                  child: (
                                      Text("${post.userId}",
                                          style: const TextStyle(color: Colors.black, fontSize: 12.0))
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                                  child: (
                                      Text("${post.userId}",
                                          style: const TextStyle(color: Colors.black, fontSize: 12.0))
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                  child: (
                                      Switch(value: deviceOne, onChanged: (bool value) {
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
              )
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}