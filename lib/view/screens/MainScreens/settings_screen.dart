import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../../../constatnt/home_components/Header.dart';
import '../onboard_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser;

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Header(
                  'Settings',
                  rightSide: Row(),
                ),
                Container(
            // width: double.infinity,
            // height: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(11),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.email!),
                  // Text(user.phoneNumber!),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Sign out"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnboardPage()));
                    },
                  )
                ],
              )),
            ),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}