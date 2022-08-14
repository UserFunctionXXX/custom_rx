import 'package:asuka/asuka.dart';
import 'package:custom_rx/home/github/github_store.dart';
import 'package:flutter/material.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({Key? key}) : super(key: key);

  @override
  State<GithubPage> createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  final GithubStore store = GithubStore();
  final overlayLoading = OverlayEntry(builder: (_) {
    return SafeArea(
      child: Container(
        color: Colors.black45,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        ),
      ),
    );
  });
  @override
  void initState() {
    super.initState();

    store.loading.addListener(() {
      if (store.loading.value) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    store.error.addListener(() {
      AsukaSnackbar.warning('Erro ao consultar github').show();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      store.fetchRepos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.fetchRepos();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text('Repositorios UserFunctionXXX'),
      ),
      body: Container(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final item = store.state.value[index];

                return ListTile(
                  title: Text(
                    item.name,
                  ),
                  subtitle: Text(item.fullname),
                );
              },
              itemCount: store.state.value.length,
            );
          },
          valueListenable: store.state,
        ),
      ),
    );
  }
}
