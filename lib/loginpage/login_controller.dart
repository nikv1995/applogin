import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget textFormFieldForEmail({required TextEditingController? email}) {
  return TextFormField(
    validator: MultiValidator([
      EmailValidator(errorText: 'Invalid Email'),
      RequiredValidator(errorText: 'Required'),
    ]),
    controller: email,
    decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: Colors.black),
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
        prefixIcon: const Icon(Icons.key, color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Password')),
  );
}

void showSnakbarForLogin(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Thank You For Login', style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.amber,
    behavior: SnackBarBehavior.floating,
  ));
}
