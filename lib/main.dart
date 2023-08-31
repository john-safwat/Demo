import 'package:demo/Presintation/UI/Home/HomeView.dart';
import 'package:demo/Presintation/UI/Login/LoginView.dart';
import 'package:demo/Presintation/UI/Register/RegisterView.dart';
import 'package:demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.routeName: (_) => LoginView(),
        RegisterView.routeName :(_) => RegisterView(),
        HomeView.routeName:(_) => HomeView()
      },
      initialRoute: LoginView.routeName,
    );
  }
}
