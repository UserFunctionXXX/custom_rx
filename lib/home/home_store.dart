import 'package:custom_rx/custom_rx/custom_rx.dart';
import 'package:flutter/cupertino.dart';

class HomeStore {
  ValueNotifier counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  void disposeListeners() {
    counter.dispose();
  }
}
