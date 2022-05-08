import 'package:flutter/material.dart';
import 'package:srm_test/screens/groups/groups.dart';
import 'package:srm_test/screens/timetable.dart';
import 'package:srm_test/screens/visitor_log.dart';
import 'package:srm_test/screens/home/home.dart';
import 'package:srm_test/screens/students/students.dart';

class CurrentScreen with ChangeNotifier {
  Widget _currentScreen = const Home();
  int _currentScreenNum = 0;

  Widget get getCurrentScreen => _currentScreen;
  int get getCurrentScreenNum => _currentScreenNum;

  void switchBody(int selectedIndex) {
    print("switch to screen #$selectedIndex ");

    switch (selectedIndex) {
      case 0:
        _currentScreen = const Home();
        _currentScreenNum = 0;
        notifyListeners();
        break;
      case 1:
        _currentScreen = const VisitorLog();
        _currentScreenNum = 1;
        notifyListeners();
        break;
      case 2:
        _currentScreen = const TimeTable();
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
        _currentScreen = const Home();
        _currentScreenNum = 0;
        notifyListeners();
        break;
    }
  }
}
