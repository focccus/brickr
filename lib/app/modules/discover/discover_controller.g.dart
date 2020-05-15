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
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$pageCountAtom = Atom(name: '_DiscoverControllerBase.pageCount');

  @override
  int get pageCount {
    _$pageCountAtom.context.enforceReadPolicy(_$pageCountAtom);
    _$pageCountAtom.reportObserved();
    return super.pageCount;
  }

  @override
  set pageCount(int value) {
    _$pageCountAtom.context.conditionallyRunInAction(() {
      super.pageCount = value;
      _$pageCountAtom.reportChanged();
    }, _$pageCountAtom, name: '${_$pageCountAtom.name}_set');
  }

  final _$loadResultsAsyncAction = AsyncAction('loadResults');

  @override
  Future<dynamic> loadResults(int count, [String s]) {
    return _$loadResultsAsyncAction.run(() => super.loadResults(count, s));
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},pageCount: ${pageCount.toString()}';
    return '{$string}';
  }
}
