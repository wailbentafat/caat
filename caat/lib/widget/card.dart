import 'package:caat/pages/insicription.dart';
import 'package:flutter/material.dart';
import 'package:caat/models/inscription.dart';


class Cardele extends StatelessWidget {
const Cardele({Key? key, required  this.insc}) : super(key: key);
  final Inscription insc;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      semanticContainer: true,
      child: Padding(padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){}, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
       child: const Text("assign")),

       

     
       ),

      );
  
      

    
  }
}