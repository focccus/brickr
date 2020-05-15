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
    _$useSecondaryAtom.reportRead();
    return super.useSecondary;
  }

  @override
  set useSecondary(bool value) {
    _$useSecondaryAtom.reportWrite(value, super.useSecondary, () {
      super.useSecondary = value;
    });
  }

  final _$useTapAtom = Atom(name: '_OptionsControllerBase.useTap');

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

  final _$addAmountAtom = Atom(name: '_OptionsControllerBase.addAmount');

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

  final _$showSpareAtom = Atom(name: '_OptionsControllerBase.showSpare');

  @override
  bool get showSpare {
    _$showSpareAtom.reportRead();
    return super.showSpare;
  }

  @override
  set showSpare(bool value) {
    _$showSpareAtom.reportWrite(value, super.showSpare, () {
      super.showSpare = value;
    });
  }

  final _$showCompletedAtom =
      Atom(name: '_OptionsControllerBase.showCompleted');

  @override
  bool get showCompleted {
    _$showCompletedAtom.reportRead();
    return super.showCompleted;
  }

  @override
  set showCompleted(bool value) {
    _$showCompletedAtom.reportWrite(value, super.showCompleted, () {
      super.showCompleted = value;
    });
  }

  @override
  String toString() {
    return '''
useSecondary: ${useSecondary},
useTap: ${useTap},
addAmount: ${addAmount},
showSpare: ${showSpare},
showCompleted: ${showCompleted}
    ''';
  }
}
