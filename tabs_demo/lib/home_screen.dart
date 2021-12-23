import 'package:flutter/material.dart';
import 'package:tabs_demo/screen_employee.dart';
import 'package:tabs_demo/screen_department.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _currentSelectedIndex = 0;

  // List<dynamic> employee = [];

  final _pages = [const EmployeeScreen(), const DepartmentScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black45,
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            _currentSelectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Employee'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Department'),
        ],
      ),
    );
  }
}
