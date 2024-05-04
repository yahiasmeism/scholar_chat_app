// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/constant.dart';
import 'package:scholar_chat_app/screens/chat_page.dart';
import 'package:scholar_chat_app/services/chat_firebase_service.dart';
import 'package:scholar_chat_app/widgets/custom_password_form_feild.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_feild.dart';
import '../helper/show_snak_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  String? email, password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  kLogoPath,
                  height: 100,
                ),
                const Center(
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      const SizedBox(height: 15),
                      CustomPasswordFromFeild(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'feild is required';
                          } else if (value != password) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        hintText: 'Confirm Password',
                        onChange: (value) {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'REGISTER',
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      try {
                        final chatFireBaseService = ChatFireBaseService(
                            email: email!, password: password!);
                        await chatFireBaseService.registerUser();
                        Navigator.pushNamed(context, ChatScreen.id,
                            arguments: chatFireBaseService);
                      } on FirebaseAuthException catch (e) {
                        showSnackBar(context, msg: e.message!);
                      } catch (e) {
                        showSnackBar(context,
                            msg: 'Oops there was an error try later');
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('already have an account?  '),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
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
    );
  }
}
