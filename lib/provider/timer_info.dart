import 'package:flutter/foundation.dart';

class TimerInfo extends ChangeNotifier{
  late int _remainingTime;

  int getRemainingTime() => _remainingTime;

  updateRemainingTime(){
    _remainingTime--;
    notifyListeners();
  }
}