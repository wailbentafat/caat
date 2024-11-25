import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String? selectedValue ;
  final List<String>  filteroption=[ "En cours", "Terminé", "Annulée"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Text(" MES INSCRIPTIONS",style: TextStyle(color: Colors.blue[600],fontSize: 24,fontWeight: FontWeight.w900),),
               SizedBox(
                 width:MediaQuery.of(context).size.width*0.16 ,
               ),
               Padding(padding: EdgeInsets.only(right: 5),child:
               ElevatedButton(
                onPressed: () async {
                  final selected = await  showMenu  <String>(
                    clipBehavior: Clip.hardEdge,
                    position: RelativeRect.fromDirectional(textDirection: TextDirection.ltr, start: BorderSide.strokeAlignCenter, top:BorderSide.strokeAlignCenter, end: BorderSide.strokeAlignCenter, bottom: BorderSide.strokeAlignCenter),
                    context: context,
                    items: filteroption.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }
                    ).toList(),
                  );
                  if (selected != null) {
                    setState(() {
                      selectedValue = selected;
                    });
                  }

                  
                }, 
               
                  
                
               
               style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width*0.255, MediaQuery.of(context).size.height*0.055),
                 backgroundColor: Colors.white,
                 foregroundColor: Colors.white,
                
                 fixedSize: Size(MediaQuery.of(context).size.width*0.25, MediaQuery.of(context).size.height*0.05),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(2),

                 ),
                 textStyle: TextStyle(fontSize: 15),
                 elevation: 2,


               ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                
                 children: [
                   Icon(
                    Icons.filter_list,
                    color: Colors.lightBlueAccent,
                   size: 17,
                  ),

                  Text("Filtre",
                  style:TextStyle(
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

           

          
        ],

      )
       
    );
  }
}