import 'package:senops/model/user.dart';
import 'package:senops/widgets/messages_widget.dart';
import 'package:senops/widgets/new_message_widget.dart';
import 'package:senops/widgets/profile_header_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final user ussers;

  const ChatPage({
    required this.ussers,
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(name: widget.ussers.name),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessageWidget(idUser: widget.ussers.idUser),
                ),
              ),
              NewMessageWidget(idUser: widget.ussers.idUser)
            ],
          ),
        ),
      );
}
