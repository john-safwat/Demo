import 'package:demo/Data/Firebase/UserDatabase.dart';
import 'package:demo/Data/Model/Users/UserDTO.dart';
import 'package:demo/Domain/Repository/User_Repository_Contract.dart';

class FirebaseUserDatabaseRemoteDataSourceImpl implements FirebaseUserDatabaseRemoteDataSource{

  UserDatabase userDatabase;
  FirebaseUserDatabaseRemoteDataSourceImpl({required this.userDatabase});

  @override
  Future<String> createUser({required UserDTO user, required String uid}) async{
    try{
      var response = await userDatabase.createUser(user: user, uid: uid);
      return response;
    }catch(e){
      return e.toString();
    }
  }

}