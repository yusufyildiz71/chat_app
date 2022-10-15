import 'package:chat_app/view/screens/Auth/login_screen.dart';
import 'package:chat_app/view/screens/onboard_screen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 182, 99, 174), backgroundColor: Colors.white,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: const Text("Login",
          style: TextStyle(
            fontFamily: 'Calisto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )),
    );
  }
}
