// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateUserController on _UpdateUserControllerBase, Store {
  final _$userNameAtom = Atom(name: '_UpdateUserControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

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

  @override
  String toString() {
    return '''
userName: ${userName},
saveChanges: ${saveChanges}
    ''';
  }
}
