import 'package:senops/model/user.dart';
import 'package:senops/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<user> users;

  const ChatBodyWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(ussers: user),
                ));
              },
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(
                user.name,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .2),
                ),
              ),
            ),
          );
        },
        itemCount: users.length,
      );
}
