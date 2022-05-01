import 'package:flutter/material.dart';
import 'package:srm_test/screens/groups.dart';
import 'package:srm_test/screens/timetable.dart';
import 'package:srm_test/screens/register.dart';
import 'package:srm_test/screens/home.dart';
import 'package:srm_test/screens/students.dart';

class CurrentScreen with ChangeNotifier {
  Widget _currentScreen = Home();
  int _currentScreenNum = 0;

  Widget get getCurrentScreen => _currentScreen;
  int get getCurrentScreenNum => _currentScreenNum;

  void switchBody(int selectedIndex) {
    print("switch to screen #${selectedIndex} ");

    switch (selectedIndex) {
      case 0:
        _currentScreen = Home();
        _currentScreenNum = 0;
        notifyListeners();
        break;
      case 1:
        _currentScreen = Register();
        _currentScreenNum = 1;
        notifyListeners();
        break;
      case 2:
        _currentScreen = TimeTable();
        _currentScreenNum = 2;
        notifyListeners();
        break;
      case 3:
        _currentScreen = Groups();
        _currentScreenNum = 3;
        notifyListeners();
        break;
      case 4:
        _currentScreen = Students();
        _currentScreenNum = 4;
        notifyListeners();
        break;
      default:
        _currentScreen = Home();
        _currentScreenNum = 0;
        notifyListeners();
        break;
    }
  }
}
