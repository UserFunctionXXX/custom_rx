import 'package:custom_rx/custom_rx/custom_rx.dart';

class HomeController {
  CustomRx counter = CustomRx<int>(0);

  void incrementValue() {
    counter.value++;
  }

  void disposeListeners() {
    counter.removeAllListeners();
  }
}
