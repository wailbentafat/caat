import 'package:flutter/material.dart';
import '../widget/card.dart';

class inscription extends StatefulWidget {
  const inscription({super.key});

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cardinsc(),

        ],
      ),
    );
  }
}