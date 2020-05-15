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
    _$idsAtom.context.enforceReadPolicy(_$idsAtom);
    _$idsAtom.reportObserved();
    return super.ids;
  }

  @override
  set ids(ObservableList<String> value) {
    _$idsAtom.context.conditionallyRunInAction(() {
      super.ids = value;
      _$idsAtom.reportChanged();
    }, _$idsAtom, name: '${_$idsAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_PartsControllerBase.isLoading');

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

  final _$getPartIdsAsyncAction = AsyncAction('getPartIds');

  @override
  Future<dynamic> getPartIds() {
    return _$getPartIdsAsyncAction.run(() => super.getPartIds());
  }

  @override
  String toString() {
    final string = 'ids: ${ids.toString()},isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}
