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
      (_$partsComputed ??= Computed<List<SetPart>>(() => super.parts)).value;
  Computed<List<SetPart>> _$spareComputed;

  @override
  List<SetPart> get spare =>
      (_$spareComputed ??= Computed<List<SetPart>>(() => super.spare)).value;
  Computed<List<SetPart>> _$ownedComputed;

  @override
  List<SetPart> get owned =>
      (_$ownedComputed ??= Computed<List<SetPart>>(() => super.owned)).value;
  Computed<bool> _$showOwnedComputed;

  @override
  bool get showOwned =>
      (_$showOwnedComputed ??= Computed<bool>(() => super.showOwned)).value;
  Computed<bool> _$showSpareComputed;

  @override
  bool get showSpare =>
      (_$showSpareComputed ??= Computed<bool>(() => super.showSpare)).value;

  final _$sAtom = Atom(name: '_CounterControllerBase.s');

  @override
  LegoSet get s {
    _$sAtom.context.enforceReadPolicy(_$sAtom);
    _$sAtom.reportObserved();
    return super.s;
  }

  @override
  set s(LegoSet value) {
    _$sAtom.context.conditionallyRunInAction(() {
      super.s = value;
      _$sAtom.reportChanged();
    }, _$sAtom, name: '${_$sAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_CounterControllerBase.filter');

  @override
  PartFilter get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(PartFilter value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$useSecondaryAtom = Atom(name: '_CounterControllerBase.useSecondary');

  @override
  bool get useSecondary {
    _$useSecondaryAtom.context.enforceReadPolicy(_$useSecondaryAtom);
    _$useSecondaryAtom.reportObserved();
    return super.useSecondary;
  }

  @override
  set useSecondary(bool value) {
    _$useSecondaryAtom.context.conditionallyRunInAction(() {
      super.useSecondary = value;
      _$useSecondaryAtom.reportChanged();
    }, _$useSecondaryAtom, name: '${_$useSecondaryAtom.name}_set');
  }

  final _$useTapAtom = Atom(name: '_CounterControllerBase.useTap');

  @override
  bool get useTap {
    _$useTapAtom.context.enforceReadPolicy(_$useTapAtom);
    _$useTapAtom.reportObserved();
    return super.useTap;
  }

  @override
  set useTap(bool value) {
    _$useTapAtom.context.conditionallyRunInAction(() {
      super.useTap = value;
      _$useTapAtom.reportChanged();
    }, _$useTapAtom, name: '${_$useTapAtom.name}_set');
  }

  final _$addAmountAtom = Atom(name: '_CounterControllerBase.addAmount');

  @override
  int get addAmount {
    _$addAmountAtom.context.enforceReadPolicy(_$addAmountAtom);
    _$addAmountAtom.reportObserved();
    return super.addAmount;
  }

  @override
  set addAmount(int value) {
    _$addAmountAtom.context.conditionallyRunInAction(() {
      super.addAmount = value;
      _$addAmountAtom.reportChanged();
    }, _$addAmountAtom, name: '${_$addAmountAtom.name}_set');
  }

  final _$initOptionsAsyncAction = AsyncAction('initOptions');

  @override
  Future<dynamic> initOptions() {
    return _$initOptionsAsyncAction.run(() => super.initOptions());
  }

  final _$_CounterControllerBaseActionController =
      ActionController(name: '_CounterControllerBase');

  @override
  void initParts(LegoSet se) {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction();
    try {
      return super.initParts(se);
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool addQuantity(SetPart p, [int q = 1]) {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction();
    try {
      return super.addQuantity(p, q);
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(SetPart p, int q) {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction();
    try {
      return super.setQuantity(p, q);
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        's: ${s.toString()},filter: ${filter.toString()},useSecondary: ${useSecondary.toString()},useTap: ${useTap.toString()},addAmount: ${addAmount.toString()},parts: ${parts.toString()},spare: ${spare.toString()},owned: ${owned.toString()},showOwned: ${showOwned.toString()},showSpare: ${showSpare.toString()}';
    return '{$string}';
  }
}
