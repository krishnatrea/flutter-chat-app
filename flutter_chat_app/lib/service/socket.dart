import 'package:flutter_chat_app/constants/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomSocket {
  CustomSocket._();
  late IO.Socket socket;
  static CustomSocket instance = CustomSocket._();

  void connect(String token, context) {
    socket = IO.io(baseurl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      "query": {"token": token}
    });
    socket.onConnect((_) {
      print('connect');
    });
    socket.onError((_) {
      print("error");
    });
    socket.on("newMessage", (data) => {});
  }

  void sendMessage(String chatroomId, String message){
     socket.emit('chatroomMessage',  {
      'chatroomId' : chatroomId,
      "message": message
    });
  }
}
