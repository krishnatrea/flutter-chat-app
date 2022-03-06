// To parse this JSON data, do
//
//     final chatRoom = chatRoomFromMap(jsonString);

import 'dart:convert';

ChatRoom chatRoomFromMap(String str) => ChatRoom.fromMap(json.decode(str));

String chatRoomToMap(ChatRoom data) => json.encode(data.toMap());

class ChatRoom {
    ChatRoom({
        required this.id,
        required this.name,
        required this.createdBy,
        required this.members,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String name;
    String createdBy;
    List<String> members;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory ChatRoom.fromMap(Map<String, dynamic> json) => ChatRoom(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        members:  List<String>.from(json["members"].map((x) => x)),
        createdAt:  DateTime.parse(json["createdAt"]),
        updatedAt:  DateTime.parse(json["updatedAt"]),
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
