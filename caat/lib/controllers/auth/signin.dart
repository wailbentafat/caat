import 'package:flutter/material.dart';

class FormControllers {
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwcontrol = TextEditingController();

  Future<Map<String, String>> signin({
    required String email,
    required String password,
  }) async {
    if (password.length < 8) {
      throw Exception('password wrong ');
    }
    Map<String, String> Userinfo = {
      'email': email,
      'password': password,
    };
    await Future.delayed(const Duration(seconds: 3));

    return Userinfo;
  }
}
