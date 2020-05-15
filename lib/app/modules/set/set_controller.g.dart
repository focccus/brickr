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
      (_$showOwnedComputed ??= Computed<bool>(() => super.showOwned,
              name: '_SetControllerBase.showOwned'))
          .value;
  Computed<bool> _$showSpareComputed;

  @override
  bool get showSpare =>
      (_$showSpareComputed ??= Computed<bool>(() => super.showSpare,
              name: '_SetControllerBase.showSpare'))
          .value;

  final _$isLoadingAtom = Atom(name: '_SetControllerBase.isLoading');

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

  final _$cachedAtom = Atom(name: '_SetControllerBase.cached');

  @override
  bool get cached {
    _$cachedAtom.reportRead();
    return super.cached;
  }

  @override
  set cached(bool value) {
    _$cachedAtom.reportWrite(value, super.cached, () {
      super.cached = value;
    });
  }

  final _$partsAtom = Atom(name: '_SetControllerBase.parts');

  @override
  List<SetPart> get parts {
    _$partsAtom.reportRead();
    return super.parts;
  }

  @override
  set parts(List<SetPart> value) {
    _$partsAtom.reportWrite(value, super.parts, () {
      super.parts = value;
    });
  }

  final _$getSetAsyncAction = AsyncAction('_SetControllerBase.getSet');

  @override
  Future<dynamic> getSet(LegoSet legoSet) {
    return _$getSetAsyncAction.run(() => super.getSet(legoSet));
  }

  final _$_SetControllerBaseActionController =
      ActionController(name: '_SetControllerBase');

  @override
  void changeTab(int i) {
    final _$actionInfo = _$_SetControllerBaseActionController.startAction(
        name: '_SetControllerBase.changeTab');
    try {
      return super.changeTab(i);
    } finally {
      _$_SetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
cached: ${cached},
parts: ${parts},
showOwned: ${showOwned},
showSpare: ${showSpare}
    ''';
  }
}
