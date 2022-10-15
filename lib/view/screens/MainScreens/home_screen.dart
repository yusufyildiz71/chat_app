import 'package:chat_app/constatnt/home_components/horizontal_users.dart';
import 'package:chat_app/constatnt/home_components/user_photo.dart';
import 'package:chat_app/constatnt/home_components/wallet_status.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constatnt/home_components/Header.dart';
import '../../../constatnt/home_components/sections.dart';
import '../../../constatnt/home_components/stories.dart';
import '../../../constatnt/home_components/userCard1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Header(
                  'Home',
                  rightSide: UserPhoto(),
                ),
                Container(
                  height: 150,
                  child: Section(
                        title: 'Stories',
                        horizontalList: <Widget>[
                          UserTip(
                            image: 'assets/kadın1.jpg',
                            name: 'Anastasia',
                          ),
                          UserTip(
                            image: 'assets/kadın2.jpg',
                            name: 'Maria',
                          ),
                          UserTip(
                            image: 'assets/kadın3.jpg',
                            name: 'Öykü',
                          ),
                          UserTip(
                            image: 'assets/kadın1.jpg',
                            name: 'Arzu',
                          ),
                        ],
                      ),
                ),
                Container(
                  height: 200,
                  child: Center(
                    child: WalletWidget(
                      100,
                      rightSide: Container(
                        child: Lottie.asset(
                          'assets/time.json',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Center(
                      child: UserHorizantal(
                    horizontalList: const <Widget>[
                      ImageCardWithInternal(
                        image: 'assets/kadın1.jpg',
                        name: 'Anastasia \n Anikina',
                        status: 'Active',
                      ),
                      ImageCardWithInternal(
                        image: 'assets/kadın2.jpg',
                        name: 'Maria \n Dry',
                        status: 'Busy',
                      ),
                      ImageCardWithInternal(
                        image: 'assets/kadın3.jpg',
                        name: 'Öykü \n Deniz',
                        status: 'Active',
                      ),
                    ],
                    title: "Top Streamers",
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
