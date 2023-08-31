import 'package:demo/Core/Base/BaseViewModel.dart';
import 'package:demo/Presintation/UI/Login/LoginNavigator.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterScreen(){
    navigator!.goToRegisterScreen();
  }

  // validation function
  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "invalid email";
    }
    return null;
  }
  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "password can't be empty";
    } else if (input.length < 8) {
      return "password is less than 8 characters";
    }
    return null;
  }

}