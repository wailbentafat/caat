import 'package:flutter/material.dart';
import '../widget/card.dart';
import '../models/inscription.dart';

class inscription extends StatefulWidget {
  const inscription({super.key});

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
    List<Inscription> inscriptionsList = [
      Inscription(
        ContractId: 1,
        categorie: 'Health Insurance',
        contractdate: DateTime(2023, 1, 1),
        DateEnd: DateTime(2024, 1, 1),
      ),
      Inscription(
        ContractId: 2,
        categorie: 'Car Insurance',
        contractdate: DateTime(2022, 5, 10),
        DateEnd: DateTime(2025, 5, 10),
      ),
      Inscription(
        ContractId: 3,
        categorie: 'Home Insurance',
        contractdate: DateTime(2021, 8, 20),
        DateEnd: DateTime(2024, 8, 20),
      ),
    ];
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const Text(
                  "Inscriptions",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 27, 89, 197),
                    fontWeight: FontWeight.w800,
                    wordSpacing: 0.3,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                   
                    },
                    child: Row(
                      children: [
                        Icon(Icons.filter_1_outlined),
                        Text("Filter"),
                      ],

                    )
                    ),
                ListView.builder(
                  itemCount: inscriptionsList.length,
                  itemBuilder: (BuildContext context, int index) {

                    Cardele cardele = Cardele(insc: inscriptionsList[index],);
                    return cardele.build(context );
                    
                  },
                ),
              ],
            ))
      ]),
    );
  }
}
