import 'package:custom_rx/models/repo_model.dart';
import 'package:custom_rx/respository/github_repository.dart';
import 'package:either_dart/either.dart';

class GithubController {
  final repository = GithubRepository();

  Future<Either<Exception, List<RepoModel>>> fetchRepos(){
    return repository.fetchRepos();
  }
}