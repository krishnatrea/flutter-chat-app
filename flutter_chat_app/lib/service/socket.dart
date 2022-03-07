
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/bloc/message/index.dart';
import 'package:flutter_chat_app/models/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomSocket {
  CustomSocket._();
  late IO.Socket socket;
  static CustomSocket instance = CustomSocket._();

  void connect(String token, context) {
    print("try to connect on socket");
    socket = IO.io('http://192.168.0.104:8000', 
    <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      "query": {"token": token}
    }
    );
    socket.connect();
    socket.onConnectError((data) => print(data.toString()));
    socket.on("disconnect", (_) => print("disconnect"));
    socket.on("ping", (_) => print("ping"));
    socket.onConnect((_) {
      log('connect');
    });
    socket.onError((_) {
      log("error");
    });
    socket.on("newMessage", (data){
      log("newMessage ${data is Map<String, dynamic>}");
      BlocProvider.of<MessageBloc>(context).add(GetMessageEvent(Message(isMe: false , message: data["message"].toString())));
    });
  }

  void joinRoom(String chatroomId){
    if(socket.connected) {
      log('socket connected');
    }
    socket.emit("joinRoom", {
      'chatroomId': chatroomId
    });
  }

  void sendMessage(String chatroomId, String message){
     socket.emit('chatroomMessage',  {
      'chatroomId' : chatroomId,
      "message": message
    });
  }
}
