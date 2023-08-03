import 'package:applogin/resources/media_query.dart';
import 'package:flutter/material.dart';
import '../signuppage/signup_controller.dart';

final _formKeyForLogin = GlobalKey<FormState>();

Widget loginBody(
    {required BuildContext context,
    required TextEditingController? email,
    required TextEditingController? password,
    required VoidCallback onLoginPressed,
    required VoidCallback onSignUpPressed}) {
  return Form(
    key: _formKeyForLogin,
    child: Center(
      child: SizedBox(
        width: MediaQueryUse.weight * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormFieldForEmail(email: email),
            SizedBox(height: MediaQueryUse.height * .05),
            textFormFieldForPassword(password: password),
            SizedBox(height: MediaQueryUse.height * .05),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15)))),
                onPressed: () {
                  if (_formKeyForLogin.currentState!.validate()) {
                    onLoginPressed();
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: MediaQueryUse.height * .028),
                )),
            SizedBox(height: MediaQueryUse.height * .02),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15)))),
                onPressed: () {
                  onSignUpPressed();
                },
                child: Text(
                  'Didnot Sign Up?',
                  style: TextStyle(fontSize: MediaQueryUse.height * .028),
                )),
          ],
        ),
      ),
    ),
  );
}
