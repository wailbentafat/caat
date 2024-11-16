import 'package:flutter/material.dart';
import '../pages/insicription.dart';
import '../pages/demandes.dart';
import '../pages/home.dart';
import '../pages/serices.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int curentpageind = 0;
  final List<Widget> pages = [
    const Home(),
    const service(),
    const inscription(),
    const demandepa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Image.asset('assets/images/caat.png' , height: 40, width: 80,),
                )
              ],
            ),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(1.0),
                child: Text('CAAT',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),)
              ],
            ),

          ],
        ),
      ),
      body: pages[curentpageind],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            curentpageind = index;
          });
        },
        elevation: 10,
        height: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        destinations:  [
          NavigationDestination(
            icon: Icon(Icons.home,size: 30,color: curentpageind==0?Colors.blue:Colors.grey,),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.search,size: 30,color: curentpageind==1?Colors.blue:Colors.grey), label: 'Services'),
          NavigationDestination(
              icon: Icon(Icons.settings,size: 30,color: curentpageind==2?Colors.blue:Colors.grey ,), label: 'Inscription',),
          NavigationDestination(
              icon: Icon(Icons.access_alarm_rounded,size: 30,color: curentpageind==3?Colors.blue:Colors.grey), label: 'Demande')
        ],
        selectedIndex: curentpageind,
      ),
    );
  }
}
