import 'package:flutter/material.dart';
import 'package:list_demo/screen_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:list_demo/screen_2.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            TextFormField(
              controller: _textController,
            ),
            ElevatedButton(
                onPressed: () {
                  saveDataToStorage();
                },
                child: const Text('Save value'))
          ],
        ))
        // ListView.separated(
        //     itemBuilder: (ctx, index) {
        //       return ListTile(
        //         title: Text('Person $index'),
        //         subtitle: Text('Message $index'),
        //         leading: const CircleAvatar(
        //           radius: 30,
        //           backgroundImage: AssetImage('assets/img/avatar.png'),
        //         ),
        //         trailing: Text('1$index:05 PM'),
        //         onTap: () {
        //           Navigator.of(context)
        //               .push(MaterialPageRoute(builder: (context) {
        //             return ScreenTwo(name: 'Person $index');
        //           }));
        //         },
        //       );
        //     },
        //     separatorBuilder: (ctx, index) {
        //       return const Divider();
        //     },
        //     itemCount: 10),
        );
  }

  Future<void> saveDataToStorage() async {
    // print(_textController.text);

    //shared preference
    final sharedPreferences = await SharedPreferences.getInstance();

    // save value
    await sharedPreferences.setString('saved_value', _textController.text);
  }

  Future<void> getSavedData(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedValue = sharedPreferences.getString('saved_value');
    if (savedValue != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ScreenTwo()));
    }
  }
}
