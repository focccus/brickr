// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sets_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SetsController on _SetsControllerBase, Store {
  final _$setsAtom = Atom(name: '_SetsControllerBase.sets');

  @override
  List<LegoSet> get sets {
    _$setsAtom.context.enforceReadPolicy(_$setsAtom);
    _$setsAtom.reportObserved();
    return super.sets;
  }

  @override
  set sets(List<LegoSet> value) {
    _$setsAtom.context.conditionallyRunInAction(() {
      super.sets = value;
      _$setsAtom.reportChanged();
    }, _$setsAtom, name: '${_$setsAtom.name}_set');
  }

  final _$getSetsAsyncAction = AsyncAction('getSets');

  @override
  Future<dynamic> getSets() {
    return _$getSetsAsyncAction.run(() => super.getSets());
  }

  @override
  String toString() {
    final string = 'sets: ${sets.toString()}';
    return '{$string}';
  }
}
