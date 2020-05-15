// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverController on _DiscoverControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_DiscoverControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$pageCountAtom = Atom(name: '_DiscoverControllerBase.pageCount');

  @override
  int get pageCount {
    _$pageCountAtom.reportRead();
    return super.pageCount;
  }

  @override
  set pageCount(int value) {
    _$pageCountAtom.reportWrite(value, super.pageCount, () {
      super.pageCount = value;
    });
  }

  final _$loadResultsAsyncAction =
      AsyncAction('_DiscoverControllerBase.loadResults');

  @override
  Future<dynamic> loadResults(int count, [String s]) {
    return _$loadResultsAsyncAction.run(() => super.loadResults(count, s));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
pageCount: ${pageCount}
    ''';
  }
}
