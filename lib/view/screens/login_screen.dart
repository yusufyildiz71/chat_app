import 'package:chat_app/view/screens/onboard_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: 200.0, child: Lottie.asset('assets/87498-fire.json')),
            SizedBox(
              height: 28.0,
            ),

            //E-Mail
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
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
                      return '';
                    } else if (!isValidEmail(value)) {
                      print('Email formatı hatalı');
                      return '';
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
            SizedBox(
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
                    label: Padding(
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
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () async {},
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
                  SizedBox(width: 16),
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
                SizedBox(
                  height: 16,
                ),
                _buildForgotPassword(context),
                SizedBox(height: 16),
                buildNoAccount(context),
              ],
            ),
          ],
        ),
      ),
    );
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardPage()));
                },
              text: 'Sign Up',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black54,
              )),
        ]));
  }
}
