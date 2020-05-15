// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SetController on _SetControllerBase, Store {
  Computed<bool> _$showOwnedComputed;

  @override
  bool get showOwned =>
      (_$showOwnedComputed ??= Computed<bool>(() => super.showOwned)).value;
  Computed<bool> _$showSpareComputed;

  @override
  bool get showSpare =>
      (_$showSpareComputed ??= Computed<bool>(() => super.showSpare)).value;

  final _$isLoadingAtom = Atom(name: '_SetControllerBase.isLoading');

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

  final _$cachedAtom = Atom(name: '_SetControllerBase.cached');

  @override
  bool get cached {
    _$cachedAtom.context.enforceReadPolicy(_$cachedAtom);
    _$cachedAtom.reportObserved();
    return super.cached;
  }

  @override
  set cached(bool value) {
    _$cachedAtom.context.conditionallyRunInAction(() {
      super.cached = value;
      _$cachedAtom.reportChanged();
    }, _$cachedAtom, name: '${_$cachedAtom.name}_set');
  }

  final _$partsAtom = Atom(name: '_SetControllerBase.parts');

  @override
  List<SetPart> get parts {
    _$partsAtom.context.enforceReadPolicy(_$partsAtom);
    _$partsAtom.reportObserved();
    return super.parts;
  }

  @override
  set parts(List<SetPart> value) {
    _$partsAtom.context.conditionallyRunInAction(() {
      super.parts = value;
      _$partsAtom.reportChanged();
    }, _$partsAtom, name: '${_$partsAtom.name}_set');
  }

  final _$getSetAsyncAction = AsyncAction('getSet');

  @override
  Future<dynamic> getSet(LegoSet legoSet) {
    return _$getSetAsyncAction.run(() => super.getSet(legoSet));
  }

  final _$_SetControllerBaseActionController =
      ActionController(name: '_SetControllerBase');

  @override
  void changeTab(int i) {
    final _$actionInfo = _$_SetControllerBaseActionController.startAction();
    try {
      return super.changeTab(i);
    } finally {
      _$_SetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},cached: ${cached.toString()},parts: ${parts.toString()},showOwned: ${showOwned.toString()},showSpare: ${showSpare.toString()}';
    return '{$string}';
  }
}
