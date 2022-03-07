
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/repository/chat_repository.dart';
import 'package:flutter_chat_app/repository/user_repository.dart';
import 'package:flutter_chat_app/screen/chat_page.dart';
import 'package:flutter_chat_app/screen/create_chat_screen.dart';
import 'package:flutter_chat_app/service/socket.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool isloading = true;

  loading() async{
   bool isloading = await ChatRepository.instance.getChatRoomsFromServer(UserRepository.instance.user!.userId, UserRepository.instance.user!.token, context);
    setState(() {
      this.isloading = !isloading;
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
    CustomSocket.instance.connect(UserRepository.instance.user!.token, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),

      body: isloading ? Center(child: CircularProgressIndicator()) : Container(
        child: ChatRepository.instance.getChatRooms!.chatrooms.isEmpty ? Center(child: Text('No chats yet! Add some friends')) :
         ListView.builder(
           itemCount: ChatRepository.instance.getChatRooms!.chatrooms.length,
           itemBuilder: (context, index) {
              return ListTile(
                title: Text(ChatRepository.instance.getChatRooms!.chatrooms[index].name),
                subtitle: Text(ChatRepository.instance.getChatRooms!.chatrooms[index].members.length.toString() + ' members'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(chatroom: ChatRepository.instance.getChatRooms!.chatrooms[index])));
                },
              );
           },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateChatRoom()));
         loading();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}