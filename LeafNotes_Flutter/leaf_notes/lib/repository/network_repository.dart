import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leaf_notes/models/notes_model.dart';
import 'package:leaf_notes/models/user_model.dart';

class ServerException implements Exception {
  final String errorMessage;
  ServerException(this.errorMessage);
}

class NetworkRepository {
  final http.Client httpClient = http.Client();

  String _endPoint(String endPoint) {
    return "http://localhost:5001/v1/$endPoint";
  }

  final Map<String, String> _header = {
    "Content-Type": "application/json; charset=utf-8"
  };

  // *                SIGN-UP

  Future<UserModel> signUp(UserModel user) async {
    final encodedParams = json.encode(user.toJson());

    final response = await httpClient.post(Uri.parse(_endPoint("user/signUp")),
        body: encodedParams, headers: _header);

    if (response.statusCode == 200) {
      //SUCCESSFULLY SIGNED UP
      final userModel =
          UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;
    } else {
      throw ServerException(json.decode(response.body)['response']);
      //
    }
  }
  // *                SIGN-IN

  Future<UserModel> signIn(UserModel user) async {
    final encodedParams = json.encode(user.toJson());

    final response = await httpClient.post(Uri.parse(_endPoint("user/signIn")),
        body: encodedParams, headers: _header);

    if (response.statusCode == 200) {
      //SUCCESSFULLY SIGNED UP
      final userModel =
          UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }
  // *                MY PROFILE

  Future<UserModel> myProfile(UserModel user) async {
    final response = await httpClient.get(
        Uri.parse(_endPoint("user/myProfile?uid=${user.uid}")),
        headers: _header);

    if (response.statusCode == 200) {
      final userModel =
          UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }


    // *                UPDATE PROFILE

    Future<UserModel> updateProfile(UserModel user) async {
    final encodedParams = json.encode(user.toJson());

    final response = await httpClient.put(
        Uri.parse(_endPoint("user/updateProfile")),
        body: encodedParams,
        headers: _header);

    if (response.statusCode == 200) {
      final userModel =
          UserModel.fromJson(json.decode(response.body)['response']);

      return userModel;
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }


  // *                GET NOTES

  Future<List<NoteModel>> getNotes(NoteModel note) async {
    //* http://localhost:5001/v1/notes/getNotes?uid=669d016df760e394d4d09b96
    final response = await httpClient.get(

        Uri.parse(_endPoint("notes/getNotes?uid=${note.creatorId}")),
        headers: _header);

    if (response.statusCode == 200) {
       List<dynamic> notes = json.decode(response.body)['response'];

      final notesData = notes.map((item) => NoteModel.fromJson(item)).toList();

      return notesData;


    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }

  Future<void> addNote(NoteModel note) async {
    final encodedParams = json.encode(note.toJson());

    final response = await httpClient.post(Uri.parse(_endPoint("notes/addNote")),
        body: encodedParams, headers: _header);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }

  Future<void> updateNote(NoteModel note) async {
    final encodedParams = json.encode(note.toJson());

    final response = await httpClient.put(Uri.parse(_endPoint("notes/updateNote")),
        body: encodedParams, headers: _header);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }

  Future<void> deleteNote(NoteModel note) async {
    final encodedParams = json.encode(note.toJson());

    final response = await httpClient.delete(Uri.parse(_endPoint("notes/deleteNote")),
        body: encodedParams, headers: _header);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw ServerException(json.decode(response.body)['response']);
    }
  }
}

