import 'package:senops/data.dart';

import '../page/Chat_page.dart';
import '../model/user.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<user> users;

  const ChatHeaderWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                'Recipients',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.search),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(ussers: users[index]),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(users[index].urlAvatar),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
}
