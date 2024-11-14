import 'dart:convert';

import 'package:flutter/material.dart';

class FormController {
  TextEditingController Prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController Num = TextEditingController();
  TextEditingController NUMI = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  ValueNotifier<bool> isValid = ValueNotifier<bool>(false);
  Future<Map<String, String>> Usersign({
    required String Prenom,
    required String nom,
    required String Num,
    required String NUMI,
    required String Email,
    required String Password,
  }) async {
    bool valid = true;
    if (Prenom.isNotEmpty &&
        nom.isNotEmpty &&
        NUMI.isNotEmpty &&
        Num.isNotEmpty &&
        Email.isNotEmpty &&
        Password.isNotEmpty) {
      valid = true;
    } else {
      valid = false;
      throw Exception("nikha");
    }
    if (Password.length < 8) {
      valid = true;
      throw Exception("nikha");
    }
    valid = true;
    isValid.value = valid;
    Map<String, String> Usersi = {
      'Prenom': Prenom,
      'email': Email,
      'password': Password,
      'NUMI': NUMI,
      'Num': Num,
      'nom': nom,
    };
    String jsonRequest = jsonEncode(Usersi);
    Future.delayed(Duration(seconds: 3));
    return Usersi;
  }
}
