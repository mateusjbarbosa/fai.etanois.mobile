// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateUserController on _CreateUserControllerBase, Store {
  final _$getNextMessageAtom = Atom(name: '_CreateUserControllerBase.getNextMessage');

  @override
  bool get getNextMessage {
    _$getNextMessageAtom.reportRead();
    return super.getNextMessage;
  }

  @override
  set getNextMessage(bool value) {
    _$getNextMessageAtom.reportWrite(value, super.getNextMessage, () {
      super.getNextMessage = value;
    });
  }

  final _$createUserMessagesAtom = Atom(name: '_CreateUserControllerBase.createUserMessages');

  @override
  ObservableList<MessageModel> get createUserMessages {
    _$createUserMessagesAtom.reportRead();
    return super.createUserMessages;
  }

  @override
  set createUserMessages(ObservableList<MessageModel> value) {
    _$createUserMessagesAtom.reportWrite(value, super.createUserMessages, () {
      super.createUserMessages = value;
    });
  }

  final _$hintMessageAtom = Atom(name: '_CreateUserControllerBase.hintMessage');

  @override
  String get hintMessage {
    _$hintMessageAtom.reportRead();
    return super.hintMessage;
  }

  @override
  set hintMessage(String value) {
    _$hintMessageAtom.reportWrite(value, super.hintMessage, () {
      super.hintMessage = value;
    });
  }

  final _$manageMessagesAsyncAction = AsyncAction('_CreateUserControllerBase.manageMessages');

  @override
  Future<void> manageMessages() {
    return _$manageMessagesAsyncAction.run(() => super.manageMessages());
  }

  final _$_verifyMessageAsyncAction = AsyncAction('_CreateUserControllerBase._verifyMessage');

  @override
  Future<void> _verifyMessage() {
    return _$_verifyMessageAsyncAction.run(() => super._verifyMessage());
  }

  final _$verifyUserMessageAsyncAction = AsyncAction('_CreateUserControllerBase.verifyUserMessage');

  @override
  Future<void> verifyUserMessage(String message) {
    return _$verifyUserMessageAsyncAction.run(() => super.verifyUserMessage(message));
  }

  @override
  String toString() {
    return '''
getNextMessage: $getNextMessage,
createUserMessages: $createUserMessages,
hintMessage: $hintMessage
    ''';
  }
}
