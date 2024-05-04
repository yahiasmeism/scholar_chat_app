// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}
