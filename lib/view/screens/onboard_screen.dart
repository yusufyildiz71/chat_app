import 'package:flutter/material.dart';

import '../../constatnt/onboard_components/login_button.dart';
import '../../constatnt/onboard_components/register_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(99, 23, 102, 1), Color(0xFF664F70)])),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.purple.shade300),
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 115),
                        child: const Text(
                          "Welcome to \n the Jungle",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'Calisto',
                              fontWeight: FontWeight.w400),
                        )),
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: const Text("",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Calisto',
                            fontWeight: FontWeight.w400)),
                  )),
              Flexible(
                  flex: 3,
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 125),
                      child: LoginButton())),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: const Text("or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Calisto',
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: RegisterButton(),
                  )),
            ],
          )),
    );
  }
}
