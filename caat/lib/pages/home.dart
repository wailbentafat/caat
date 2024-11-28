import 'package:flutter/material.dart';
import 'package:caat/models/inscription.dart';
import 'package:caat/widget/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedValue;
  final List<String> filteroption = ["En cours", "Terminé", "Annulée"];
  
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " MES INSCRIPTIONS",
                style: TextStyle(
                  color: const Color.fromARGB(255, 51, 137, 212),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: () async {
                    final selected = await showMenu<String>(
                      clipBehavior: Clip.hardEdge,
                      position: RelativeRect.fromLTRB(100, 150, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      popUpAnimationStyle: AnimationStyle(
                        curve: Curves.bounceIn,
                        duration: Duration(milliseconds: 0700),
                      ),
                      context: context,
                      elevation: 3,
                      color: Colors.white,
                      surfaceTintColor: Colors.blueAccent,
                      items: filteroption.map((String value) {
                        selectedValue = value;
                        return PopupMenuItem<String>(
                          textStyle: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          padding: const EdgeInsets.all(5),
                          height: 40,
                          onTap: () => {},
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                    if (selected != null) {
                      setState(() {
                        selectedValue = selected;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.255,
                      MediaQuery.of(context).size.height * 0.055,
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.25,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                          color: const Color.fromARGB(255, 109, 186, 221),
                          width: 0.3),
                    ),
                    textStyle: TextStyle(fontSize: 15),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: Colors.lightBlueAccent,
                        size: 17,
                      ),
                      Text(
                        "Filtre",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.lightBlueAccent,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: inscriptionsList.length,  // Length of your data
              itemBuilder: (BuildContext context, int index) {
                Cardele cardele = Cardele(insc: inscriptionsList[index]);
                return cardele.build(context);  // Call build method of Cardele
              },
            ),
          ),
        ],
      ),
    );
  }
}
