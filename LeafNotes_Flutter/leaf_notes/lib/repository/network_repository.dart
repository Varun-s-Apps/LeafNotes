import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leaf_notes/models/user_model.dart';

class ServerException implements Exception{

  final String errorMessage;
  ServerException(this.errorMessage);

}




class NetworkRepository{

  final http.Client httpClient = http.Client();

  String _endPoint(String endPoint){
    return "http://localhost:5000/v1/$endPoint";

  }

  final Map<String, String> _header = {
    "Content-Type" : "application/json; charset=utf-8"
  };


  Future<UserModel> signUp(UserModel user) async {

    final encodedParams = json.encode(user.toJson());


    final response = await httpClient.post(Uri.parse(_endPoint("user/signUp")), body: encodedParams, headers: _header);


    if(response.statusCode == 200){
      //SUCCESSFULLY SIGNED UP
      final userModel = UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;

    }else{
      throw ServerException(json.decode(response.body)['response']);
      //
    }
    

  }

  Future<UserModel> signIn(UserModel user) async {

        final encodedParams = json.encode(user.toJson());


    final response = await httpClient.post(Uri.parse(_endPoint("user/signIn")), body: encodedParams, headers: _header);


    if(response.statusCode == 200){
      //SUCCESSFULLY SIGNED UP
      final userModel = UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;

    }else{
      throw ServerException(json.decode(response.body)['response']);
    }
    
    
  }
}