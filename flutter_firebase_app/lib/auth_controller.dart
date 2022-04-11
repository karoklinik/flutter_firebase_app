import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/login_page.dart';
import 'package:flutter_firebase_app/welcome_page.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
//auth initialization from network
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges()); //tracking login,logut,etc.

    //connect to firebase (listener, callbackfunction)
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      // ignore: avoid_print
      print("login page");
      Get.offAll(() => const LoginPage());
    } else {
      //user already logged in
      Get.offAll(() => const WelcomePage());
    }
  }

  void register(String email, password) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About user", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Creation failed"),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }
}
