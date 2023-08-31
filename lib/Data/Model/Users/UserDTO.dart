class UserDTO {

  String email;
  String password;
  String name;

  UserDTO({
    required this.email ,
    required this.password,
    required this.name
  });

  UserDTO.fromFireStore(Map<String , dynamic> json):this(
    email: json["email"],
    password: json['password'],
    name: json['name']
  );

  Map<String ,dynamic> toFireStore(){
    return {
      "email" : email ,
      'password' : password ,
      'name' : name
    };
  }

}