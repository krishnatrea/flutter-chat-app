import 'dart:async';
import 'dart:developer' as developer;

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
   
  @override
  Stream<MessageState> applyAsync(
      {MessageState? currentState, MessageBloc? bloc}) async* {
    try {
      yield UnMessageState();
      await Future.delayed(const Duration(seconds: 1));
      yield InMessageState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadMessageEvent', error: _, stackTrace: stackTrace);
      yield ErrorMessageState( _.toString());
    }
  }
}
