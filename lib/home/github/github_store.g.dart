// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GithubStore on _GithubStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_GithubStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_GithubStoreBase.error', context: context);

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_GithubStoreBase.state', context: context);

  @override
  List<RepoModel> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(List<RepoModel> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchReposAsyncAction =
      AsyncAction('_GithubStoreBase.fetchRepos', context: context);

  @override
  Future<void> fetchRepos() {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
state: ${state}
    ''';
  }
}
