import 'package:amazkart/components/alertsComp.dart';
import 'package:amazkart/components/categoryComp.dart';
import 'package:amazkart/components/homeComp.dart';
import 'package:amazkart/components/profileComp.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: NavigationBar(
            backgroundColor: Colors.white,
            height: 70,
            elevation: 0,
            onDestinationSelected: (int index){
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.black,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(FluentIcons.home_20_filled, color: Colors.white,),
                icon: Icon(FluentIcons.home_20_regular),
                label: "Home",
              ),
              NavigationDestination(
                selectedIcon: Icon(FluentIcons.grid_20_filled, color: Colors.white,),
                icon: Icon(FluentIcons.grid_20_regular),
                label: "Category",
              ),
              NavigationDestination(
                selectedIcon: Icon(FluentIcons.alert_20_filled, color: Colors.white,),
                icon: Icon(FluentIcons.alert_20_regular),
                label: "Alerts",
              ),
              NavigationDestination(
                selectedIcon: Icon(FluentIcons.person_20_filled, color: Colors.white,),
                icon: Icon(FluentIcons.person_20_regular),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        const HomeComp(),
        const CategoryComp(),
        const AlertsComp(),
        const ProfileComp(),
      ][currentPageIndex],
    );
  }
}