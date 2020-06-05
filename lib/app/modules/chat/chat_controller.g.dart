// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$userCreatedAtom = Atom(name: '_ChatControllerBase.userCreated');

  @override
  bool get userCreated {
    _$userCreatedAtom.reportRead();
    return super.userCreated;
  }

  @override
  set userCreated(bool value) {
    _$userCreatedAtom.reportWrite(value, super.userCreated, () {
      super.userCreated = value;
    });
  }

  final _$hintMessageAtom = Atom(name: '_ChatControllerBase.hintMessage');

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

  final _$getNextMessageAtom = Atom(name: '_ChatControllerBase.getNextMessage');

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

  final _$chatMessagesAtom = Atom(name: '_ChatControllerBase.chatMessages');

  @override
  ObservableList<MessageModel> get chatMessages {
    _$chatMessagesAtom.reportRead();
    return super.chatMessages;
  }

  @override
  set chatMessages(ObservableList<MessageModel> value) {
    _$chatMessagesAtom.reportWrite(value, super.chatMessages, () {
      super.chatMessages = value;
    });
  }

  final _$manageChatAsyncAction = AsyncAction('_ChatControllerBase.manageChat');

  @override
  Future<void> manageChat() {
    return _$manageChatAsyncAction.run(() => super.manageChat());
  }

  final _$verifyUserMessageAsyncAction = AsyncAction('_ChatControllerBase.verifyUserMessage');

  @override
  Future<void> verifyUserMessage(String message) {
    return _$verifyUserMessageAsyncAction.run(() => super.verifyUserMessage(message));
  }

  @override
  String toString() {
    return '''
userCreated: $userCreated,
hintMessage: $hintMessage,
getNextMessage: $getNextMessage,
chatMessages: $chatMessages
    ''';
  }
}
