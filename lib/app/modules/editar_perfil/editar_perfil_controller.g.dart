// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditarPerfilController on _EditarPerfilControllerBase, Store {
  final _$saveChangesAtom = Atom(name: '_EditarPerfilControllerBase.saveChanges');

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

  final _$_EditarPerfilControllerBaseActionController = ActionController(name: '_EditarPerfilControllerBase');

  @override
  void haveChanges(bool c) {
    final _$actionInfo =
        _$_EditarPerfilControllerBaseActionController.startAction(name: '_EditarPerfilControllerBase.haveChanges');
    try {
      return super.haveChanges(c);
    } finally {
      _$_EditarPerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
saveChanges: $saveChanges
    ''';
  }
}
