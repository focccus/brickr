// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterController on _CounterControllerBase, Store {
  Computed<List<SetPart>> _$partsComputed;

  @override
  List<SetPart> get parts =>
      (_$partsComputed ??= Computed<List<SetPart>>(() => super.parts,
              name: '_CounterControllerBase.parts'))
          .value;
  Computed<List<SetPart>> _$spareComputed;

  @override
  List<SetPart> get spare =>
      (_$spareComputed ??= Computed<List<SetPart>>(() => super.spare,
              name: '_CounterControllerBase.spare'))
          .value;
  Computed<List<SetPart>> _$ownedComputed;

  @override
  List<SetPart> get owned =>
      (_$ownedComputed ??= Computed<List<SetPart>>(() => super.owned,
              name: '_CounterControllerBase.owned'))
          .value;
  Computed<bool> _$showOwnedComputed;

  @override
  bool get showOwned =>
      (_$showOwnedComputed ??= Computed<bool>(() => super.showOwned,
              name: '_CounterControllerBase.showOwned'))
          .value;
  Computed<bool> _$showSpareComputed;

  @override
  bool get showSpare =>
      (_$showSpareComputed ??= Computed<bool>(() => super.showSpare,
              name: '_CounterControllerBase.showSpare'))
          .value;

  final _$sAtom = Atom(name: '_CounterControllerBase.s');

  @override
  LegoSet get s {
    _$sAtom.reportRead();
    return super.s;
  }

  @override
  set s(LegoSet value) {
    _$sAtom.reportWrite(value, super.s, () {
      super.s = value;
    });
  }

  final _$filterAtom = Atom(name: '_CounterControllerBase.filter');

  @override
  PartFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(PartFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$useSecondaryAtom = Atom(name: '_CounterControllerBase.useSecondary');

  @override
  bool get useSecondary {
    _$useSecondaryAtom.reportRead();
    return super.useSecondary;
  }

  @override
  set useSecondary(bool value) {
    _$useSecondaryAtom.reportWrite(value, super.useSecondary, () {
      super.useSecondary = value;
    });
  }

  final _$useTapAtom = Atom(name: '_CounterControllerBase.useTap');

  @override
  bool get useTap {
    _$useTapAtom.reportRead();
    return super.useTap;
  }

  @override
  set useTap(bool value) {
    _$useTapAtom.reportWrite(value, super.useTap, () {
      super.useTap = value;
    });
  }

  final _$addAmountAtom = Atom(name: '_CounterControllerBase.addAmount');

  @override
  int get addAmount {
    _$addAmountAtom.reportRead();
    return super.addAmount;
  }

  @override
  set addAmount(int value) {
    _$addAmountAtom.reportWrite(value, super.addAmount, () {
      super.addAmount = value;
    });
  }

  final _$initPartsAsyncAction =
      AsyncAction('_CounterControllerBase.initParts');

  @override
  Future<void> initParts(LegoSet se) {
    return _$initPartsAsyncAction.run(() => super.initParts(se));
  }

  final _$initOptionsAsyncAction =
      AsyncAction('_CounterControllerBase.initOptions');

  @override
  Future<dynamic> initOptions() {
    return _$initOptionsAsyncAction.run(() => super.initOptions());
  }

  final _$_CounterControllerBaseActionController =
      ActionController(name: '_CounterControllerBase');

  @override
  bool addQuantity(SetPart p, [int q = 1]) {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction(
        name: '_CounterControllerBase.addQuantity');
    try {
      return super.addQuantity(p, q);
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(SetPart p, int q) {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction(
        name: '_CounterControllerBase.setQuantity');
    try {
      return super.setQuantity(p, q);
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
s: ${s},
filter: ${filter},
useSecondary: ${useSecondary},
useTap: ${useTap},
addAmount: ${addAmount},
parts: ${parts},
spare: ${spare},
owned: ${owned},
showOwned: ${showOwned},
showSpare: ${showSpare}
    ''';
  }
}
