// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$loginAcceptedAtom = Atom(name: '_ChatControllerBase.loginAccepted');

  @override
  bool get loginAccepted {
    _$loginAcceptedAtom.reportRead();
    return super.loginAccepted;
  }

  @override
  set loginAccepted(bool value) {
    _$loginAcceptedAtom.reportWrite(value, super.loginAccepted, () {
      super.loginAccepted = value;
    });
  }

  final _$haveActionsAtom = Atom(name: '_ChatControllerBase.haveActions');

  @override
  bool get haveActions {
    _$haveActionsAtom.reportRead();
    return super.haveActions;
  }

  @override
  set haveActions(bool value) {
    _$haveActionsAtom.reportWrite(value, super.haveActions, () {
      super.haveActions = value;
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
  ObservableList<Message> get chatMessages {
    _$chatMessagesAtom.reportRead();
    return super.chatMessages;
  }

  @override
  set chatMessages(ObservableList<Message> value) {
    _$chatMessagesAtom.reportWrite(value, super.chatMessages, () {
      super.chatMessages = value;
    });
  }

  final _$messageKeyAtom = Atom(name: '_ChatControllerBase.messageKey');

  @override
  GlobalKey<AnimatedListState> get messageKey {
    _$messageKeyAtom.reportRead();
    return super.messageKey;
  }

  @override
  set messageKey(GlobalKey<AnimatedListState> value) {
    _$messageKeyAtom.reportWrite(value, super.messageKey, () {
      super.messageKey = value;
    });
  }

  final _$manageChatAsyncAction = AsyncAction('_ChatControllerBase.manageChat');

  @override
  Future<void> manageChat() {
    return _$manageChatAsyncAction.run(() => super.manageChat());
  }

  final _$verifyUserMessageAsyncAction =
      AsyncAction('_ChatControllerBase.verifyUserMessage');

  @override
  Future<void> verifyUserMessage(String message) {
    return _$verifyUserMessageAsyncAction
        .run(() => super.verifyUserMessage(message));
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  void insertMessageAnimation() {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.insertMessageAnimation');
    try {
      return super.insertMessageAnimation();
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userCreated: ${userCreated},
loginAccepted: ${loginAccepted},
haveActions: ${haveActions},
hintMessage: ${hintMessage},
getNextMessage: ${getNextMessage},
chatMessages: ${chatMessages},
messageKey: ${messageKey}
    ''';
  }
}
