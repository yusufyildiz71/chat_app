import 'package:chat_app/view/screens/home_screen.dart';
import 'package:chat_app/view/screens/onboard_screen.dart';
import 'package:chat_app/view/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constatnt/login_components/or_divider.dart';
import '../../constatnt/login_components/sign_in_social.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _eMail;
  String? _password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;
  //FirebaseAuth _auth = FirebaseAuth.instance;
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Bir şeyler ters gitti.."),
                );
              } else if (snapshot.hasData) {
                print("snapshot.hasdata");
                return const HomePage();
              } else {
                print("BOŞŞŞŞŞ");
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                          height: 200.0,
                          child: Lottie.asset('assets/87498-fire.json')),
                      const SizedBox(
                        height: 28.0,
                      ),

                      //E-Mail
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                print('Email boş olamaz.');
                                return 'Email boş olamaz.';
                              } else if (!isValidEmail(value)) {
                                print('Email formatı hatalı');
                                return 'Email formatı hatalı';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),

                      //Password
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print('Şifre alanı boş olamaz.');
                              return '';
                            } else if (value.length < 6) {
                              print('Şifreniz minimum 6 haneli olmalıdır.');
                              return '';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              label: const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text("Password"),
                              ),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          obscureText: !isVisible,
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black,
                              primary: Colors.black,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              minimumSize: const Size(double.infinity, 50)),
                          onPressed: () async {
                            signIn();
                          },
                          child: Text("Sign In",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      const OrDivider(),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // iconlarin basladigi yer
                            SignInSocial.buildSocial(
                                context,
                                const FaIcon(
                                  FontAwesomeIcons.apple,
                                  color: Colors.black,
                                )),
                            const SizedBox(width: 16),
                            SignInSocial.buildSocial(
                                context,
                                const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          _buildForgotPassword(context),
                          const SizedBox(height: 16),
                          buildNoAccount(context),
                        ],
                      ),
                    ],
                  ),
                );
              }
            })));
  }

  Future signIn() async {
    

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  GestureDetector _buildForgotPassword(BuildContext context) {
    return GestureDetector(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              decoration: TextDecoration.underline, color: Colors.black54),
        ),
        // şifre unuttum kismi burda birazdan yap
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnboardPage()));
        });
  }

  RichText buildNoAccount(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black54),
            text: "No Account? ",
            children: [
          TextSpan(
              // hesabın olmaması burda
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              text: 'Sign Up',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black54,
              )),
        ]));
  }
}
