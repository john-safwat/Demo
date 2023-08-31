import 'package:demo/Data/Model/Users/UserDTO.dart';

class MyUser {
  String email;
  String password;
  String name;

  MyUser({
    required this.email ,
    required this.password,
    required this.name
  });

  UserDTO toDataSource(){
    return UserDTO(email: email, password: password, name: name);
  }
}