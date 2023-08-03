import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../HomePage/home_screen.dart';
import '../resources/key_store.dart';
import '../resources/shared_pref.dart';
import '../signuppage/signup_screen.dart';
import 'login_controller.dart';
import 'login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();

  void onSignupTap() {
    FocusManager.instance.primaryFocus!.unfocus();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  void onLoginTap() {
    FocusManager.instance.primaryFocus!.unfocus();

    String data = SharedPref.getString(KeyStore.USERDATA);

    if (data != '') {
      List userData = jsonDecode(data);

      bool isLogin = userData.any((element) =>
          element[KeyStore.EMAIL] == email.text &&
          element[KeyStore.PASS] == password.text);

      if (isLogin) {
        SharedPref.setValue(key: 'ISLOGIN', value: true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
        showSnakbarForLogin(context);
      } else {
        Fluttertoast.showToast(
            msg: 'Invalid Email Or Password',
            backgroundColor: Colors.amber,
            textColor: Colors.black);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'No User Found Please Signup',
          backgroundColor: Colors.amber,
          textColor: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Container(
          child: loginBody(
            context: context,
            email: email,
            password: password,
            onLoginPressed: onLoginTap,
            onSignUpPressed: onSignupTap,
          ),
        ));
  }
}
