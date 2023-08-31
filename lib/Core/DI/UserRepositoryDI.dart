import 'package:demo/Data/DataSource/FirebaseAuthRemoteDataSourceImpl.dart';
import 'package:demo/Data/DataSource/FirebaseUserDatabaseRemoteDataSourceImpl.dart';
import 'package:demo/Data/Firebase/FirebaseAuth.dart';
import 'package:demo/Data/Firebase/UserDatabase.dart';
import 'package:demo/Data/Repository/UserRepositoryImpl.dart';
import 'package:demo/Domain/Repository/User_Repository_Contract.dart';


UserDatabase getUserDatabase(){
  return UserDatabase.getUserDatabaseInstance();
}

FirebaseUserDatabaseRemoteDataSource getFirebaseUserDatabaseRemoteDataSource(UserDatabase userDatabase){
  return FirebaseUserDatabaseRemoteDataSourceImpl(userDatabase: userDatabase);
}
FirebaseUserAuth getFirebaseUserAuth(){
  return FirebaseUserAuth.getFirebaseAuthInstance();
}

FirebaseAuthRemoteDataSource getFirebaseAuthRemoteDataSource(FirebaseUserAuth firebaseUserAuth){
  return FirebaseAuthRemoteDataSourceImpl(firebaseUserAuth: firebaseUserAuth);
}

UserRepository getUserRepo(FirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource , FirebaseUserDatabaseRemoteDataSource firebaseUserDatabaseRemoteDataSource){
  return UserRepositoryImpl(firebaseAuthRemoteDataSource: firebaseAuthRemoteDataSource, firebaseUserDatabaseRemoteDataSource: firebaseUserDatabaseRemoteDataSource);
}

UserRepository injectUserRepo(){
  return getUserRepo(getFirebaseAuthRemoteDataSource(getFirebaseUserAuth()), getFirebaseUserDatabaseRemoteDataSource(getUserDatabase()));
}