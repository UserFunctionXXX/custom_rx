// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:custom_rx/home/github/github_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_rx/main.dart';

void main() {
  group('testa store', () {
    test('testa RepoStore sem receber dados', () async {
      final GithubStore store = GithubStore();

      expect(store.state.length, 0);
    });

    test('testa RepoStore receber dados', () async {
      final GithubStore store = GithubStore();

      await store.fetchRepos();

      expect(store.state.length, greaterThanOrEqualTo(1));
    });
  });
}
