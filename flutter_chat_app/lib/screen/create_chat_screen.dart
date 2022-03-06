

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/repository/chat_repository.dart';
import 'package:flutter_chat_app/repository/user_repository.dart';

class CreateChatRoom extends StatefulWidget {
   CreateChatRoom({Key? key}) : super(key: key);

  @override
  State<CreateChatRoom> createState() => _CreateChatRoomState();
}

class _CreateChatRoomState extends State<CreateChatRoom> {
  late String chatId;

  TextEditingController _controller = TextEditingController();

  bool _isCreated = false;
  bool _isLoading = false;


  createChat() async {
    chatId = await ChatRepository.instance.createChatRoom(_controller.text,UserRepository.instance.user!.token , UserRepository.instance.user!.userId);
    if(chatId != ""){
      _isCreated = true;
    }
    _controller.clear();
    await getUsers();
    setState(() {

    });
  }
  getUsers() async {
    bool _isLoading =  await UserRepository.instance.getUsers(context);
      setState(() {
      this._isLoading = _isLoading;
    });
  }

  addMembers(String id) async {
   bool _isAdded = await ChatRepository.instance.addUserToChatRoom(chatId, UserRepository.instance.user!.token, id, context);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isCreated ?  Text('Add Members') :  Text('Create Chat Room'),
      ),
      body: _isCreated ? 
      !_isLoading ?  Center(child: CircularProgressIndicator())
       : ListView.builder(
         itemCount: UserRepository.instance.users!.users.length,
         itemBuilder: (context, index) {
           return ListTile(
             title: Text(UserRepository.instance.users!.users[index].name),
             onTap: () {
               addMembers(UserRepository.instance.users!.users[index].id);
             },
           );
         },)
       : Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextField(
               controller: _controller,
               decoration: InputDecoration(
                 hintText: 'Enter Chat Room Name',
               ),
             ),
             RaisedButton(
               child: Text('Create'),
               onPressed: () {
                 createChat();
               },
             ),
           ],
         ),
       ),
    );
  }
}