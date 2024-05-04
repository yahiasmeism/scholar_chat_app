// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/constant.dart';
import 'package:scholar_chat_app/helper/show_snak_bar.dart';
import 'package:scholar_chat_app/screens/chat_page.dart';
import 'package:scholar_chat_app/services/chat_firebase_service.dart';
import 'package:scholar_chat_app/widgets/custom_password_form_feild.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final _fromKey = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: _fromKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    kLogoPath,
                    height: 100,
                  ),
                  const Center(
                    child: Text(
                      'ScholarChat',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFromFeild(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'feild is required';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomPasswordFromFeild(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'feild is required';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'LOGIN',
                    onPressed: () async {
                      if (_fromKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final chatFireBaseService = ChatFireBaseService(
                            email: email!, password: password!);
                            await chatFireBaseService.loginUser();
                        Navigator.pushNamed(context, ChatScreen.id,arguments: chatFireBaseService);
                        } on FirebaseAuthException catch (e) {
                          showSnackBar(context, msg: e.message!);
                        } catch (e) {
                          showSnackBar(context,
                              msg: 'Oops there was an error try later');
                        }
                      }
                      setState(
                        () {
                          isLoading = false;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('don\'t have an account?  '),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'RegisterScreen');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
