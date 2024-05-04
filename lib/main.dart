import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/firebase_options.dart';
import 'package:scholar_chat_app/screens/chat_page.dart';
import 'package:scholar_chat_app/screens/login_screen.dart';
import 'package:scholar_chat_app/screens/register_screen.dart';
import 'package:scholar_chat_app/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        ChatScreen.id: (context) => const ChatScreen()
      },
      initialRoute: LoginScreen.id,
      theme: themeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
