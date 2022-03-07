import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/models/message.dart';

abstract class MessageState extends Equatable {
  MessageState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnMessageState extends MessageState {

  UnMessageState();

  @override
  String toString() => 'UnMessageState';
}

/// Initialized
class InMessageState extends MessageState {
  InMessageState(this.message);
  
  final Message message;

  @override
  String toString() => 'InMessageState $message';

  @override
  List<Object> get props => [message];
}

class ErrorMessageState extends MessageState {
  ErrorMessageState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorMessageState';

  @override
  List<Object> get props => [errorMessage];
}

class JoinedChannalState extends MessageState {
  JoinedChannalState(this.channel);
  
  final String channel;

  @override
  String toString() => 'JoinedChannalState $channel';

  @override
  List<Object> get props => [channel];
}
