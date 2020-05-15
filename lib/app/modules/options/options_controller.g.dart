// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OptionsController on _OptionsControllerBase, Store {
  final _$useSecondaryAtom = Atom(name: '_OptionsControllerBase.useSecondary');

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

  final _$useTapAtom = Atom(name: '_OptionsControllerBase.useTap');

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

  final _$addAmountAtom = Atom(name: '_OptionsControllerBase.addAmount');

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

  final _$showSpareAtom = Atom(name: '_OptionsControllerBase.showSpare');

  @override
  bool get showSpare {
    _$showSpareAtom.context.enforceReadPolicy(_$showSpareAtom);
    _$showSpareAtom.reportObserved();
    return super.showSpare;
  }

  @override
  set showSpare(bool value) {
    _$showSpareAtom.context.conditionallyRunInAction(() {
      super.showSpare = value;
      _$showSpareAtom.reportChanged();
    }, _$showSpareAtom, name: '${_$showSpareAtom.name}_set');
  }

  final _$showCompletedAtom =
      Atom(name: '_OptionsControllerBase.showCompleted');

  @override
  bool get showCompleted {
    _$showCompletedAtom.context.enforceReadPolicy(_$showCompletedAtom);
    _$showCompletedAtom.reportObserved();
    return super.showCompleted;
  }

  @override
  set showCompleted(bool value) {
    _$showCompletedAtom.context.conditionallyRunInAction(() {
      super.showCompleted = value;
      _$showCompletedAtom.reportChanged();
    }, _$showCompletedAtom, name: '${_$showCompletedAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'useSecondary: ${useSecondary.toString()},useTap: ${useTap.toString()},addAmount: ${addAmount.toString()},showSpare: ${showSpare.toString()},showCompleted: ${showCompleted.toString()}';
    return '{$string}';
  }
}
