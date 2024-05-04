import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholar_chat_app/constant.dart';

class ChatFireBaseService {
  final String email;
  final String password;
  ChatFireBaseService({required this.email, required this.password});

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessageCollection() {
    var messageCollection =
        FirebaseFirestore.instance.collection(kMessageCollection);
    return messageCollection.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> addMessageToMessageCollection({
    required String message,
  }) {
    var messageCollection =
        FirebaseFirestore.instance.collection(kMessageCollection);
    return messageCollection.add(
        {'message': message, 'email': email, 'createdAt': Timestamp.now()});
  }
}
