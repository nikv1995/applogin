import 'package:applogin/resources/media_query.dart';
import 'package:applogin/signuppage/signup_controller.dart';
import 'package:flutter/material.dart';

final _formKeyForSignup = GlobalKey<FormState>();

Widget signup({
  required BuildContext context,
  required TextEditingController? firstname,
  required TextEditingController? lastname,
  required TextEditingController? email,
  required TextEditingController? password,
  required TextEditingController? confirmpassword,
  required VoidCallback onPressed,
}) {
  return Form(
    key: _formKeyForSignup,
    child: Center(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: MediaQueryUse.height * .65,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              Flexible(child: textFormFieldForFirstName(firstname: firstname)),
              SizedBox(width: MediaQueryUse.weight * .05),
              Flexible(child: textFormFieldForLastName(lastname: lastname))
            ],
          ),
          Flexible(child: textFormFieldForEmail(email: email)),
          Flexible(
            child: textFormFieldForPassword(password: password),
          ),
          Flexible(
              child: textFormFieldForConfirmPassword(
                  password: password, confirmpassword: confirmpassword)),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              onPressed: () {
                if (_formKeyForSignup.currentState!.validate()) {
                  onPressed();
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: MediaQueryUse.height * .028),
              )),
        ]),
      ),
    )),
  );
}
