// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateUserController on _UpdateUserControllerBase, Store {
  final _$saveChangesAtom = Atom(name: '_UpdateUserControllerBase.saveChanges');

  @override
  bool get saveChanges {
    _$saveChangesAtom.reportRead();
    return super.saveChanges;
  }

  @override
  set saveChanges(bool value) {
    _$saveChangesAtom.reportWrite(value, super.saveChanges, () {
      super.saveChanges = value;
    });
  }

  final _$_UpdateUserControllerBaseActionController =
      ActionController(name: '_UpdateUserControllerBase');

  @override
  void haveChanges(bool c) {
    final _$actionInfo = _$_UpdateUserControllerBaseActionController
        .startAction(name: '_UpdateUserControllerBase.haveChanges');
    try {
      return super.haveChanges(c);
    } finally {
      _$_UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
saveChanges: ${saveChanges}
    ''';
  }
}
