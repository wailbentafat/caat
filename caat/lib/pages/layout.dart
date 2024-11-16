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
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const Home(),
    const service(),
    const inscription(),
    const demandepa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), 
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/caat.png',
                    width: 80,
                    height: 70, 
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_none_outlined, color: Colors.blue,size: 30,),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person_2_outlined, color: Colors.blue,size: 30,),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        elevation: 10,
        height: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              size: 40,
              color: currentPageIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              size: 40,
              color: currentPageIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
              size: 40,
              color: currentPageIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Inscription',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.access_alarm_rounded,
              size: 40,
              color: currentPageIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Demande',
          ),

        ], 
        selectedIndex: currentPageIndex,
        
         
      ),
    );
  }
}
