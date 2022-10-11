import 'package:chat_app/view/screens/login_screen.dart';
import 'package:chat_app/view/screens/onboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constatnt/login_components/or_divider.dart';
import '../../constatnt/login_components/sign_in_social.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _name;
  String? _eMail;
  String? _phone;
  String? _password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isVisible = false;
  //FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore=FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;

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
            SizedBox(
                height: 200.0, child: Lottie.asset('assets/87498-fire.json')),
            const SizedBox(
              height: 28.0,
            ),
            //Name
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      print('İsim boş olamaz.');
                      return '';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            //E-Mail
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
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
            const SizedBox(
              height: 8.0,
            ),
            //phone
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      print('Telefon boş olamaz.');
                      return '';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Phone",
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
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () async {
                  createUser(nameController.text, emailController.text, phoneController.text, passwordController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  });
                  
                },
                child: Text("Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
              ),
            ),
            const OrDivider(),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       // iconlarin basladigi yer
            //       SignInSocial.buildSocial(
            //           context,
            //           const FaIcon(
            //             FontAwesomeIcons.apple,
            //             color: Colors.black,
            //           ),),
            //       const SizedBox(width: 16),
            //       SignInSocial.buildSocial(
            //           context,
            //           const FaIcon(
            //             FontAwesomeIcons.google,
            //             color: Colors.black,
            //           )),
            //     ],
            //   ),
            // ),
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
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
            text: "Have Account? ",
            children: [
          TextSpan(
              // hesabın olmaması burda
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              text: 'Sign İn',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black54,
              )),
        ]));
  }

Future<User?> createUser(String name,String email,String phone,String password) async{
  var user=await _auth.createUserWithEmailAndPassword(email: email, password: password) ;
  await _fireStore.collection("users").doc(user.user?.uid).set({
    'email':email,
    'name':name,
    'phone':phone,
  });
  return user.user;
}

}
