import 'package:custom_rx/home/home_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final HomeController controller = HomeController();

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.disposeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reatividade Renan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.controller.incrementValue,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              'Valor do contador ${widget.controller.counter.value}',
              style: const TextStyle(fontSize: 25),
            );
          },
          valueListenable: widget.controller.counter,
          child: Text(
            'Valor do contador ${widget.controller.counter.value}',
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
