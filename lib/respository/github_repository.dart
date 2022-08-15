import 'package:custom_rx/models/repo_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

const URL_PORTIFOLIO = 'https://api.github.com/users/UserFunctionXXX/repos';

class GithubRepository {
  Future<Either<Exception, List<RepoModel>>> fetchRepos() async {
    try {
      final result = await Dio().get(URL_PORTIFOLIO);
      return Right(
          (result.data as List).map((e) => RepoModel.fromMap(e)).toList());
    } on Exception catch (e, stack) {
      return Left(e);
    } finally {}
  }
}
