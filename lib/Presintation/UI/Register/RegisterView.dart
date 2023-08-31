import 'package:demo/Core/Base/BaseStete.dart';
import 'package:demo/Data/DataSource/FirebaseAuthRemoteDataSourceImpl.dart';
import 'package:demo/Data/Firebase/FirebaseAuth.dart';
import 'package:demo/Data/Firebase/UserDatabase.dart';
import 'package:demo/Data/Repository/UserRepositoryImpl.dart';
import 'package:demo/Domain/Repository/User_Repository_Contract.dart';
import 'package:demo/Domain/UseCase/CreateUserUseCase.dart';
import 'package:demo/Presintation/UI/Home/HomeView.dart';
import 'package:demo/Presintation/UI/Register/RegisterNavigator.dart';
import 'package:demo/Presintation/UI/Register/RegisterViewModel.dart';
import 'package:flutter/material.dart';

import '../../../Data/DataSource/FirebaseUserDatabaseRemoteDataSourceImpl.dart';

class RegisterView extends StatefulWidget {
  static const routeName = "Register";
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView , RegisterViewModel> implements RegisterNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Register"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: viewModel!.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: viewModel!.nameController,
                    decoration: const InputDecoration(
                      label: Text("name"),
                    ),
                    validator: (value) => viewModel!.nameValidation(value!),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: viewModel!.emailController,
                    decoration: const InputDecoration(
                      label: Text("email"),
                    ),
                    validator: (value) => viewModel!.emailValidation(value!),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: viewModel!.passwordController,
                    decoration: const InputDecoration(
                      label: Text("password"),
                    ),
                    validator: (value) => viewModel!.passwordValidation(value!),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: viewModel!.register,
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Register")],
                        ),
                      )
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel(
      useCase: injectCreateUserUseCase()
    );
  }

  @override
  goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }
}
