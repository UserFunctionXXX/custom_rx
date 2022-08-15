import 'package:flutter/material.dart';

class CounterStore {
  ValueNotifier counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  void disposeListeners() {
    counter.dispose();
  }
}
