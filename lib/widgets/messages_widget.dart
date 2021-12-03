import 'package:senops/api/firebaseAPI.dart';
import 'package:senops/model/message.dart';
import 'package:senops/widgets/message_widget.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class MessageWidget extends StatelessWidget {
  final String idUser;

  const MessageWidget({
    required this.idUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        stream: FirebaseAPI.getMessages(idUser),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return buildText('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;

                return messages!.isEmpty
                    ? buildText('Say Hi..')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];

                          return messageWidget(
                            message: message,
                            isMe: message.idUser == myId,
                          );
                        },
                      );
              }
          }
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
