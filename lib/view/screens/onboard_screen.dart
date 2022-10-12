import 'package:chat_app/view/screens/login_screen.dart';
import 'package:chat_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

import '../../constatnt/onboard_components/login_button.dart';
import '../../constatnt/onboard_components/register_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.black,
          activeColor: Colors.deepOrange,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        
        skipButton: TextButton(
          onPressed: () {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.black),
          ),
        ),
        
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => state.isLastPage
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                  : _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.black),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Meet new people",
    description: "Jungle lets you meet and relate to new people",
    imgUrl: "assets/kadın1.jpg",
  ),
  const OnBoardModel(
    title: "Meet new people",
    description:
        "ungle lets you meet and relate to new people",
    imgUrl: 'assets/kadın2.jpg',
  ),
  const OnBoardModel(
    title: "Meet new peopleı",
    description: "ungle lets you meet and relate to new people",
    imgUrl: 'assets/kadın3.jpg',
  ),
];

/*class OnboardPage extends StatefulWidget {
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
} */
