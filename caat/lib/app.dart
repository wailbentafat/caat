import 'package:caat/pages/layout.dart';
import 'package:caat/pages/signin.dart';
import 'package:flutter/material.dart';
import './pages/signup.dart';
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Layout(),
    );
  }
}