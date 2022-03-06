// To parse this JSON data, do
//
//     final getChatRooms = getChatRoomsFromMap(jsonString);

import 'dart:convert';

GetChatRooms getChatRoomsFromMap(String str) => GetChatRooms.fromMap(json.decode(str));

String getChatRoomsToMap(GetChatRooms data) => json.encode(data.toMap());

class GetChatRooms {
    GetChatRooms({
        required this.message,
        required this.chatrooms,
    });

    final String message;
    final List<Chatroom> chatrooms;

    factory GetChatRooms.fromMap(Map<String, dynamic> json) => GetChatRooms(
        message: json["message"] == null ? null : json["message"],
        chatrooms:  List<Chatroom>.from(json["chatrooms"].map((x) => Chatroom.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "chatrooms": chatrooms == null ? null : List<dynamic>.from(chatrooms.map((x) => x.toMap())),
    };
}

class Chatroom {
    Chatroom({
        required this.id,
        required this.name,
        required this.createdBy,
        required this.members,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String name;
    final String createdBy;
    final List<String> members;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory Chatroom.fromMap(Map<String, dynamic> json) => Chatroom(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        members:  List<String>.from(json["members"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "createdBy": createdBy == null ? null : createdBy,
        "members": members == null ? null : List<dynamic>.from(members.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
    };
}
