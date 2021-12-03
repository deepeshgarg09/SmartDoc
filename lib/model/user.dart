import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../utils.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class user {
  final String idUser;
  final String name;
  final String urlAvatar;
  final DateTime? lastMessageTime;

  const user({
    required this.idUser,
    required this.name,
    required this.urlAvatar,
    this.lastMessageTime,
  });

  user copyWith({
    String? idUser,
    String? name,
    String? urlAvatar,
    DateTime? lastMessageTime,
  }) =>
      user(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  static user fromJson(Map<String, dynamic> json) => user(
        idUser: json['idUser'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
        //lastMessageTime: Utils.fromDateTimeToJson(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        //'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
      };
}
