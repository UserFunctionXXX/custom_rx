import 'package:custom_rx/models/repo_model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'github_store.g.dart';

const URL_PORTIFOLIO = 'https://api.github.com/users/UserFunctionXXX/repos';

class GithubStore = _GithubStoreBase with _$GithubStore;

abstract class _GithubStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  Exception? error;

  @observable
  List<RepoModel> state = <RepoModel>[];

  @action
  setLoading(bool isLoading) {
    loading = isLoading;
  }

  @action
  Future<void> insertRepos(List<RepoModel> repos) async {
    try {
      state = repos;
    } catch (e) {
      error = Exception('Erro ao pegar repositorio');
    }
  }

  @action
  Future<void> insertError(Exception e) async {
    error = e;
  }
}
