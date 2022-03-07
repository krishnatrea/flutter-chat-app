import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_chat_app/models/message.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class MessageEvent {
  Stream<MessageState> applyAsync(
      {MessageState currentState, MessageBloc bloc});
}

class UnMessageEvent extends MessageEvent {
  @override
  Stream<MessageState> applyAsync({MessageState? currentState, MessageBloc? bloc}) async* {
    yield UnMessageState();
  }
}

class GetMessageEvent extends MessageEvent {
  final Message message ;
  GetMessageEvent(this.message);
   
  @override
  Stream<MessageState> applyAsync(
      {MessageState? currentState, MessageBloc? bloc}) async* {
    try {
      yield UnMessageState();
      await Future.delayed(const Duration(seconds: 1));
      yield InMessageState(message);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMessageEvent', error: _, stackTrace: stackTrace);
      yield ErrorMessageState( _.toString());
    }
  }
}


class JoinChannalEvent extends MessageEvent {
  final String channal;
  JoinChannalEvent({required this.channal});
  @override
  Stream<MessageState> applyAsync(
      {MessageState? currentState, MessageBloc? bloc}) async* {
    try {
      yield UnMessageState();
      await Future.delayed(const Duration(seconds: 1));
      // yield InMessageState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMessageEvent', error: _, stackTrace: stackTrace);
      yield ErrorMessageState( _.toString());
    }
  }
}

class ExitChannalEvent extends MessageEvent {
  final String channal;
  ExitChannalEvent({required this.channal});
  @override
  Stream<MessageState> applyAsync(
      {MessageState? currentState, MessageBloc? bloc}) async* {
    try {
      yield UnMessageState();
      await Future.delayed(const Duration(seconds: 1));
      // yield InMessageState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMessageEvent', error: _, stackTrace: stackTrace);
      yield ErrorMessageState( _.toString());
    }
  }
}

class SendMessageEvent extends MessageEvent {
  final String message;
  final String channal;
  SendMessageEvent({required this.message, required this.channal});
  @override
  Stream<MessageState> applyAsync(
      {MessageState? currentState, MessageBloc? bloc}) async* {
    try {
      yield UnMessageState();
      await Future.delayed(const Duration(seconds: 1));
      // yield InMessageState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMessageEvent', error: _, stackTrace: stackTrace);
      yield ErrorMessageState( _.toString());
    }
  }
}