import 'package:custom_rx/home/github/github_page.dart';
import 'package:custom_rx/home/home_controller.dart';
import 'package:custom_rx/home/home_store.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = HomeController();
  final HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.disposeListeners();
    store.disposeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reatividade Renan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementValue();
          store.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  'Valor do contador com custom RX ${controller.counter.value}',
                  style: const TextStyle(fontSize: 20),
                );
              },
              valueListenable: controller.counter,
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  'Valor do contador com Store ${store.counter.value}',
                  style: const TextStyle(fontSize: 20),
                );
              },
              valueListenable: store.counter,
            ),
            const SizedBox(
              height: 55,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GithubPage()),
                );
              },
              child: const Text('Navegar Reatividade API GITHUB'),
            ),
          ],
        ),
      ),
    );
  }
}
