import 'package:demo/Core/Base/BaseViewModel.dart';
import 'package:demo/Domain/UseCase/CreateUserUseCase.dart';
import 'package:demo/Presintation/UI/Register/RegisterNavigator.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator>{

  CreateUserUseCase useCase;
  RegisterViewModel({required this.useCase});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  // validation function
  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name){
    if (name.isEmpty){
      return "Name Can't Be Empty";
    }else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)){
      return "Invalid Name";
    }else {
      return null;
    }
  }

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



  Future<void> register()async{
    if(formKey.currentState!.validate()){
      try{
        var response = await useCase.invoke(name: nameController.text, email: emailController.text, password: passwordController.text);
        debugPrint(response);
        navigator!.goToHomeScreen();
      }catch(e){
        debugPrint(e.toString());
      }
    }
  }
}