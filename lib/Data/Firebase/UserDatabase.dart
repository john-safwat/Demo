import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Data/Model/Users/UserDTO.dart';

class UserDatabase {

  UserDatabase._();
  static UserDatabase? instance;
  static getUserDatabaseInstance(){
    return instance??=UserDatabase._();
  }

  CollectionReference<UserDTO> getCollectionReference() {
    return FirebaseFirestore.instance.collection("users").withConverter(
        fromFirestore: (snapshot, options) => UserDTO.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),);
  }

  Future<String> createUser({required UserDTO user , required String uid})async{
    await getCollectionReference().doc(uid).set(user);
    return "User Added Successfully";
  }

}