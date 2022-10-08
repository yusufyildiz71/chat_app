import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'onboard_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user=FirebaseAuth.instance.currentUser;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (user != null) {
    final email = user!.email;
    final password=user!.phoneNumber;
}
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email!),
            // Text(user.phoneNumber!),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text("Sign out"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnboardPage()));
              },
            )
          ],
        )),
      ),
    );
  }
}
