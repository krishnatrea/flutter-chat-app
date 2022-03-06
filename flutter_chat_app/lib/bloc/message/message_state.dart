import 'package:equatable/equatable.dart';

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
  InMessageState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InMessageState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorMessageState extends MessageState {
  ErrorMessageState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorMessageState';

  @override
  List<Object> get props => [errorMessage];
}
