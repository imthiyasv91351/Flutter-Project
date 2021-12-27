import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext ctx, int newValue, Widget? child) {
                return Text(
                  newValue.toString(),
                  style: const TextStyle(fontSize: 50, color: Colors.purple),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    // setState(() {
                    _counter.value = _counter.value - 1;
                    // });
                  },
                  child: const Icon(Icons.remove)),
              FloatingActionButton(
                  onPressed: () {
                    // setState(() {
                    _counter.value = _counter.value + 1;
                    // });
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    _counter.value = 0;
                    // });
                  },
                  child: const Text('RESET'))
            ],
          )
        ],
      ),
    );
  }
}
