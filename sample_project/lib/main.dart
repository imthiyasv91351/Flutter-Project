import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.indigo, tabBarTheme: const TabBarTheme()),
      home: HomeScreen(),
    );
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String name = 'Demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text(
          'Demo',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),

      // body: Text("Demo"),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ignore: avoid_unnecessary_containers
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            null;
                          },
                          child: const Text(
                            'Click me',
                            style: TextStyle(color: Colors.white),
                          )),
                      IconButton(
                          onPressed: () {
                            null;
                          },
                          icon: const Icon(Icons.work))
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      child: const Text('Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )))
                ],
              ),
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 10,
                  color: Colors.white,
                )),
            // color: Colors.black,
            child: const Center(
                child: Text(
              'Test',
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
          )),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            null;
                          },
                          child: const Text(
                            'Click me',
                            style: TextStyle(color: Colors.white),
                          )),
                      IconButton(
                          onPressed: () {
                            null;
                          },
                          icon: const Icon(Icons.work))
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      child: const Text('Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )))
                ],
              ),
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          null;
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: [Text('Employee'), Text('Department')],
      //   ),
      //   color: Colors.purple[900],
      // ),
    );
  }
}
