import 'package:flutter/foundation.dart';

class AlarmProvider with ChangeNotifier {
  // Example alarm list
  List<DateTime> _alarms = [];

  List<DateTime> get alarms => _alarms;

  void addAlarm(DateTime time) {
    _alarms.add(time);
    notifyListeners();
  }

  void removeAlarm(DateTime time) {
    _alarms.remove(time);
    notifyListeners();
  }
}
