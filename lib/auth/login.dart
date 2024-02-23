import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_m_shop/UI/homeUI/home.dart';
import 'package:the_m_shop/main.dart';

class login extends StatelessWidget {
  const login({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Navigate to the next page
    Get.to(() => const MyScaffold());

    // Return the UserCredential
    return userCredential;
  }

  Future<void> _guest() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      Get.to(() => const  MyScaffold());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          const AlertDialog(
            title: Text("You are not allowed, try again later"),
          );
          break;
        default:
          const AlertDialog(
            title: Text("Unknown Error, please try again"),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose Your Account",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow[100]),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Call the signInWithGoogle function
                          await signInWithGoogle();
                        },
                        child: Image.asset(
                          "assets/Logo-google-icon-PNG.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.limeAccent[50]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: _guest,
                        child: Image.asset(
                          "assets/Instagram-photo-frame-template-and-social-media-notification-icon-design-template-on-transparent-background-PNG.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "login as a guest",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.limeAccent[50]),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
