import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _counter.toString(),
            style: const TextStyle(fontSize: 50, color: Colors.purple),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _counter = _counter - 1;
                    });
                  },
                  child: const Icon(Icons.remove)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _counter = _counter + 1;
                    });
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Text('RESET'))
            ],
          )
        ],
      ),
    );
  }
}
