import 'package:flutter/cupertino.dart';

class TimeProvider extends ChangeNotifier {
  int _remainingTime = 60;
  int _initialTime = 60;

  int get remainingTime => _initialTime;
  int get initialTime => _initialTime;
}
