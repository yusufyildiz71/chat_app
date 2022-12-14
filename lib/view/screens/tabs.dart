import 'package:chat_app/view/screens/MainScreens/favorites_screen.dart';
import 'package:chat_app/view/screens/MainScreens/home_screen.dart';
import 'package:chat_app/view/screens/MainScreens/match_screen.dart';
import 'package:chat_app/view/screens/MainScreens/messages_screen.dart';
import 'package:chat_app/view/screens/MainScreens/settings_screen.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'onboard_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser;
  int tabIndex = 1;
  late TabController tabController =
      TabController(length: 5, vsync: this, initialIndex: tabIndex);
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (user != null) {
      final email = user!.email;
      final password = user!.phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.message, color: Colors.black),
          Icon(Icons.all_inclusive, color: Colors.red),
          Icon(Icons.favorite, color: Colors.black),
          Icon(
            Icons.settings,
            color: Colors.black,
          )
        ],
        inactiveIcons: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.message, color: Colors.black),
          Icon(Icons.all_inclusive, color: Colors.red),
          Icon(Icons.favorite, color: Colors.black),
          Icon(
            Icons.settings,
            color: Colors.black,
          )
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: 0,
        onChanged: (v) {
          tabIndex = v;
          tabController.animateTo(v);
          setState(() {});
        },
        // tabCurve: ,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.red,
        elevation: 10,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          const Home(),
          const Messages(),
          const Match(),
          const Favorites(),
          const Settings(),
        ],
      ),
    );
  }
}
