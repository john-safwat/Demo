import 'package:demo/Data/Model/Users/UserDTO.dart';
import 'package:demo/Domain/Models/Users/User.dart';

abstract class FirebaseAuthRemoteDataSource {

  Future<String> createUser({required UserDTO user});
  Future<String> login({required String email , required String password});

}

abstract class FirebaseUserDatabaseRemoteDataSource {
  Future<String> createUser({required UserDTO user , required String uid});
}

abstract class UserRepository {
  Future<String> createUser({required MyUser user});
}