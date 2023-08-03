import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget textFormFieldForFirstName({required TextEditingController? firstname}) {
  return TextFormField(
    validator: MultiValidator([
      RequiredValidator(errorText: 'Required'),
    ]),
    controller: firstname,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('First Name')),
  );
}

Widget textFormFieldForLastName({required TextEditingController? lastname}) {
  return TextFormField(
    validator: MultiValidator([
      RequiredValidator(errorText: 'Required'),
    ]),
    controller: lastname,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Last Name')),
  );
}

Widget textFormFieldForEmail({required TextEditingController? email}) {
  return TextFormField(
    validator: MultiValidator([
      EmailValidator(errorText: 'Invalid Email'),
      RequiredValidator(errorText: 'Required'),
    ]),
    controller: email,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Email')),
  );
}

Widget textFormFieldForPassword({required TextEditingController? password}) {
  return TextFormField(
    obscureText: true,
    validator: MultiValidator([
      LengthRangeValidator(
          min: 6, max: 14, errorText: 'Enter Password Between 6 to 14 Char'),
      RequiredValidator(errorText: 'Required'),
    ]),
    controller: password,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Password')),
  );
}

Widget textFormFieldForConfirmPassword(
    {required TextEditingController? confirmpassword,
    required TextEditingController? password}) {
  return TextFormField(
    obscureText: true,
    validator: (value) {
      if (value != password?.text) {
        return 'Password Should Be Matched';
      }
      return null;
    },
    controller: confirmpassword,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Confirm Password')),
  );
}

void showSnakebar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Thnak for Signup', style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.amber,
    behavior: SnackBarBehavior.floating,
  ));
}
