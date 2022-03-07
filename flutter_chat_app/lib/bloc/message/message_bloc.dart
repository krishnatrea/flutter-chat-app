import 'dart:async';
import 'dart:developer' as developer;
import 'index.dart';


import 'package:bloc/bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {

  MessageBloc() : super(UnMessageState()){
   on<MessageEvent>((event, emit) {
      return emit.forEach<MessageState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'MessageBloc', error: error, stackTrace: stackTrace);
          return ErrorMessageState(error.toString());
        },
      );
    });
  }
}
