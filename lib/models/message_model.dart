import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String email;
  final Timestamp createdAt;

  MessageModel(
      {required this.message, required this.email, required this.createdAt});

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(
      message: jsonData['message'],
      email: jsonData['email'],
      createdAt: jsonData['createdAt'],
    );
  }
}
