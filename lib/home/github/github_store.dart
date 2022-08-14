import 'package:custom_rx/models/repo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

const URL_PORTIFOLIO = 'https://api.github.com/users/UserFunctionXXX/repos';

class GithubStore {
  final loading = ValueNotifier(false);
  final error = ValueNotifier<Exception?>(null);
  final state = ValueNotifier<List<RepoModel>>([]);

  Future<void> fetchRepos() async {
    loading.value = true;
    try {
      final result = await Dio().get(URL_PORTIFOLIO);
      state.value =
          (result.data as List).map((e) => RepoModel.fromMap(e)).toList();
    } catch (e) {
      error.value = Exception('Erro ao pegar repositorio');
    } finally {
      loading.value = false;
    }
  }
}
