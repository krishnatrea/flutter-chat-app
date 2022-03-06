import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/login_page.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
late IO.Socket socket ;

void connect() {

  
  socket.onError((_) {
    print("error");
  });
  print(socket.connected);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}
