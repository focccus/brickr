// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartsController on _PartsControllerBase, Store {
  final _$idsAtom = Atom(name: '_PartsControllerBase.ids');

  @override
  ObservableList<String> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(ObservableList<String> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PartsControllerBase.isLoading');

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

  final _$getPartIdsAsyncAction =
      AsyncAction('_PartsControllerBase.getPartIds');

  @override
  Future<dynamic> getPartIds() {
    return _$getPartIdsAsyncAction.run(() => super.getPartIds());
  }

  @override
  String toString() {
    return '''
ids: ${ids},
isLoading: ${isLoading}
    ''';
  }
}
