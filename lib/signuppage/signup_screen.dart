import 'dart:convert';
import 'package:applogin/signuppage/signup_controller.dart';
import 'package:applogin/signuppage/signup_widget.dart';
import 'package:flutter/material.dart';

import '../resources/key_store.dart';
import '../resources/shared_pref.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  void onTap() {
    FocusManager.instance.primaryFocus!.unfocus();

    List dataStore = [];

    String data = SharedPref.getString('USERDATA');

    if (data != '') {
      dataStore = jsonDecode(data);
      dataStore.add({
        KeyStore.EMAIL: email.text,
        KeyStore.PASS: password.text,
        KeyStore.FNAME: firstname.text,
        KeyStore.LNAME: lastname.text
      });
    } else {
      dataStore.add({
        KeyStore.EMAIL: email.text,
        KeyStore.PASS: password.text,
        KeyStore.FNAME: firstname.text,
        KeyStore.LNAME: lastname.text
      });
    }
    SharedPref.setValue(key: 'USERDATA', value: jsonEncode(dataStore));
    Navigator.pop(context);
    setState(() {});
    showSnakebar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: signup(
        context: context,
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        confirmpassword: confirmpassword,
        onPressed: onTap,
      ),
    );
  }
}
