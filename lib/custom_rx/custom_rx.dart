import 'package:flutter/foundation.dart';

class CustomRx<T> extends ValueListenable {
  final _callbacks = <VoidCallback>[];
  T _value;
  CustomRx(T initialValue) : _value = initialValue;

  T get value => _value;
  set value(T newValue) {
    _value = newValue;
    _notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    _callbacks.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _callbacks.remove(listener);
  }

  void removeAllListeners() {
    for (var callback in _callbacks) {
      removeListener(callback);
    }
  }

  void _notifyListeners() {
    if (_callbacks.isEmpty) return;

    for (var callback in _callbacks) {
      callback();
    }
  }
}
