import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senops/model/user.dart';
import '../utils.dart';
import 'package:senops/model/message.dart';
import 'package:senops/model/user.dart';
import '../data.dart';

class FirebaseAPI {
  static Stream<List<user>> getUsers() => FirebaseFirestore.instance
      .collection('userss')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(user.fromJson));

  static Future uploadMessage(String idUser, String message) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/${idUser}/messages');

    final newMessage = Message(
      idUser: myId,
      urlAvatar: myUrlAvatar,
      username: myUsername,
      message: message,
      createdAt: Timestamp.now(),
    );
    await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('userss');
    await refUsers
        .doc(idUser)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/${idUser}/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<user> users) async {
    final refUsers = FirebaseFirestore.instance.collection('userss');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(idUser: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }
}
