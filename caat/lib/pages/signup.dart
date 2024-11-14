// ignore_for_file: prefer_const_constructors

import 'package:caat/pages/signin.dart';
import 'package:flutter/material.dart';
import '../controllers/auth/signin.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FormControllers formControllers = FormControllers();
  bool isloading = false;
  Map<String, String>? userinfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bienvenue chez CAAT",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text(
                "Accédez à votre espace personnel pour gérer vos contrats et demandes facilement",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Padding(
                padding: EdgeInsets.only(left: 17.0, bottom: 6),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              controller: formControllers.emailcontrol,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: true,
              autocorrect: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintFadeDuration: Duration(milliseconds: 200),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.6)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 128, 124, 124), width: 0.6),
                  gapPadding: 7.0,
                ),
                hintText: 'Entrez votre email',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Padding(
                padding: EdgeInsets.only(left: 17.0, bottom: 6),
                child: Text(
                  "password",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              controller: formControllers.passwcontrol,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              enableSuggestions: true,
              autocorrect: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintFadeDuration: Duration(milliseconds: 200),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.6)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 128, 124, 124), width: 0.6),
                  gapPadding: 7.0,
                ),
                hintText: 'Entrez votre password',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => {print("heyyy")},
                  child: Text(
                    "forget password?",
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF374AA4)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 150, vertical: 15.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              onPressed: isloading ? null : _handleSignIn,
              child: isloading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Signin",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 3.0),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "nouvaeu client?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: Text(
                  "Creet un compte",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              ),
            )
          ])
        ],
      )),
    );
  }

  void _handleSignIn() async {
    setState(() {
      isloading = true;
    });

    try {
      userinfo = await formControllers.signin(
        email: formControllers.emailcontrol.text,
        password: formControllers.passwcontrol.text,
      );

      print('User info: $userinfo');
    } catch (e) {
      print('Error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }
}
