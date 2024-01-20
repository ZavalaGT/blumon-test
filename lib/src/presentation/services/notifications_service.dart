import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar({required String message, Color? color}) {
    final snackBar = SnackBar(
        backgroundColor: color ?? const Color.fromARGB(255, 185, 59, 59),
        duration: const Duration(seconds: 5),
        content: Text(message,
            style: const TextStyle(color: Colors.white, fontSize: 20)));
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
