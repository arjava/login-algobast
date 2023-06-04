import 'dart:async';

import 'package:dio/dio.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;
  Dio? _dio = Dio();
  String? data;

  Future<User?> getUser() async {
    Response? response = await _dio?.get("https://reqres.in/api/users?page=2");
    if(response?.statusCode==200){
    print("RESPONSE USER: ${response?.data['data']}");
    data = "${response?.data['data']}";
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(data.toString()),
    );
      // () => _user = User(const Uuid().v4()),
    }else{
      return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User("ZONK"),
    );
    }
  }
}