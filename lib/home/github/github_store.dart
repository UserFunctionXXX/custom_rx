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
  Future<void> fetchRepos() async {
    loading = true;
    try {
      final result = await Dio().get(URL_PORTIFOLIO);
      state = (result.data as List).map((e) => RepoModel.fromMap(e)).toList();
    } catch (e) {
      error = Exception('Erro ao pegar repositorio');
    } finally {
      loading = false;
    }
  }
}
