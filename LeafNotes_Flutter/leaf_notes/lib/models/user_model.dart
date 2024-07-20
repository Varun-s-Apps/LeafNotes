import 'package:equatable/equatable.dart';

class UserModel extends Equatable{


  final String? uid;
  final String? username;
  final String? email;
  final String? password;

  UserModel({this.uid = "", this.username, this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      uid: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "username" : username,
      "email" : email,
      "uid" : uid,
      "password":password
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, password, uid];

}