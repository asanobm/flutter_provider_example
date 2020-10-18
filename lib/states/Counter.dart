import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  // this method change _count state
  void increment() {
    _count++;
    notifyListeners();
  }

  // decrement _count
  void decrement() {
    try {
      validateValue(_count);
      _count--;
      notifyListeners();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class DontNotSetMinusValueException implements Exception {
  String _message;

  DontNotSetMinusValueException([String message = 'Invalid value']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

void validateValue(int value) {
  if (value == null) {
    throw new DontNotSetMinusValueException();
  } else if (value <= 0) {
    throw new DontNotSetMinusValueException("value must be greater than 0");
  }
}
