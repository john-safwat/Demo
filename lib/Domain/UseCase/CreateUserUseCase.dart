import 'package:demo/Core/DI/UserRepositoryDI.dart';
import 'package:demo/Domain/Models/Users/User.dart';
import 'package:demo/Domain/Repository/User_Repository_Contract.dart';

class CreateUserUseCase {

  UserRepository repository;
  CreateUserUseCase({required this.repository});

  Future<String> invoke({required String name , required String email , required String password})async{
    var response = await repository.createUser(user: MyUser(email: email, password: password, name: name));
    return response;
  }

}

CreateUserUseCase injectCreateUserUseCase(){
  return CreateUserUseCase(repository: injectUserRepo());
}