import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constant.dart';
import 'package:scholar_chat_app/models/message_model.dart';
import 'package:scholar_chat_app/services/chat_firebase_service.dart';
import 'package:scholar_chat_app/widgets/bubble_message.dart';
import 'package:scholar_chat_app/widgets/bubble_message_for_friend.dart';

import '../widgets/input_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = 'ChatScreen';
  @override
  Widget build(BuildContext context) {
    List<MessageModel> messagesBubble = [];
    final chatFireBaseService =
        ModalRoute.of(context)!.settings.arguments! as ChatFireBaseService;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecoundryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 50,
              kLogoPath,
            ),
            const Text(
              'Chat',
              style: TextStyle(
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatFireBaseService.streamMessageCollection(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // convert recive date from firebase to model
                  messagesBubble = snapshot.data!.docs.map((e) {
                    return MessageModel.fromJson(e.data());
                  }).toList();
                  return ListView.builder(
                    reverse: true,
                    itemCount: messagesBubble.length,
                    itemBuilder: (context, index) {
                      if (messagesBubble[index].email ==
                          chatFireBaseService.email) {
                        return BubbleMessage(
                          messageModel: messagesBubble[index],
                        );
                      } else {
                        return BubbleMessageForFriend(
                            messageModel: messagesBubble[index]);
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          InputMessage(
            onSubmited: (value) {
              chatFireBaseService.addMessageToMessageCollection(message: value);
            },
          ),
        ],
      ),
    );
  }
}
