
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/models/getusers.dart' as getusers;
import 'package:flutter_chat_app/models/register.dart' as reg;
import 'package:flutter_chat_app/models/user.dart';
import 'package:flutter_chat_app/service/networkservice.dart';

class UserRepository {
  User? user;
  getusers.GetUser? users;
  UserRepository._();
  static UserRepository instance = UserRepository._();
  Future<bool> login(String email , String password , BuildContext context) async{
    String response = await ApiRepository.instance.postRequest(url: baseurl+loginconst, context: context, header: {
      "Content-Type": "application/json"
    }, quarryperam: {
      "email": email,
      "password": password
    });

   user =  User.fromMap(jsonDecode(response));
   return user != null;
  }
  Future<bool> register(reg.UserRegister register, BuildContext context) async{
     String response = await ApiRepository.instance.postRequest(url: baseurl+signup, context: context, header: {
      "Content-Type": "application/json"
    }, quarryperam: register.toMap());

   Map<String, String>  map =  jsonDecode(response);
   if(map['message'] == "User created successfully"){
     return true;
   }
    return false;
  }

  Future<bool> getUsers(BuildContext context) async{
    String response = await ApiRepository.instance.getRequest(url: baseurl+getAllusers , context: context, header:  {
      "Content-Type": "application/json",
      "Authorization": "Bearer "+user!.token
    });
    Map<String, dynamic> list = jsonDecode(response);
    users = getusers.GetUser.fromMap(list);
    return users != null;
  }
}