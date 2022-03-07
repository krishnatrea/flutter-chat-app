import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/models/getchatrooms.dart';
import 'package:flutter_chat_app/service/networkservice.dart';

class ChatRepository {
  ChatRepository._();
  static final ChatRepository instance = ChatRepository._();
  GetChatRooms? getChatRooms;
  Future<bool> getChatRoomsFromServer(
      String userid, String token, BuildContext context) async {
    String response = await ApiRepository.instance.postRequest(
        url: baseurl + getAllchats,
        header: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        quarryperam: {"userId": userid},
        context: context);
    getChatRooms = getChatRoomsFromMap(response);
    return getChatRooms != null;
  }

  Future<String> createChatRoom(
      String chatroomName, String token, String userId) async {
    String response = await ApiRepository.instance
        .postRequest(url: baseurl + createchat, header: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }, quarryperam: {
      "name": chatroomName,
      "createdBy": userId,
    });
  Map<String, dynamic> map = jsonDecode(response);
  if(map["message"] == "Chatroom created successfully"){
    return map["chatroom"]["_id"];
  }
  return "";
  }

  Future<bool> addUserToChatRoom(
      String chatroomId, String token, String userId, BuildContext context) async {
    String response = await ApiRepository.instance
        .postRequest(url: baseurl + addmenber, header: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }, quarryperam: {
      "chatroomId": chatroomId,
      "userId": userId,
    }, context: context );
    Map<String, dynamic> map = jsonDecode(response);
    if(map["message"] == "Member added successfully"){
      return true;
    }
    return false;
  }
}
