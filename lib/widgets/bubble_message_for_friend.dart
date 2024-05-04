import 'package:flutter/material.dart';
import 'package:scholar_chat_app/models/message_model.dart';

class BubbleMessageForFriend extends StatelessWidget {
  const BubbleMessageForFriend({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        margin: const EdgeInsets.only(
          right: 16,
          left: 64,
          top: 6,
          bottom: 6,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: const BoxDecoration(
          color: Color(0xff026387),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Text(messageModel.message),
      ),
    );
  }
}
