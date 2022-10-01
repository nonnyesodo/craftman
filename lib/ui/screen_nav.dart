import 'package:craftman/ui/home_s.dart';
import 'package:craftman/ui/me_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  final screens = [
    const Homescreen(),
    const Mesreens(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9AB4C2),
      body: IndexedStack(
        index: currentindex,
        children: screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 4,
            curve: Curves.linearToEaseOut,
            activeColor: Colors.red,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 100),
            tabBackgroundColor: const Color(0xFF262b50),
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'home',
              ),
              GButton(
                icon: Icons.person,
                text: 'profile',
              ),
            ],
            selectedIndex: currentindex,
            onTabChange: (index) => setState(() => currentindex = index),
          ),
        ),
      ),
    );
  }
}
