import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constant.dart';
import 'package:scholar_chat_app/models/message_model.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 64,
          top: 6,
          bottom: 6,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Text(messageModel.message),
      ),
    );
  }
}
