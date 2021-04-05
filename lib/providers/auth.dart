
import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/dio.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get authenticated => _isAuthenticated;

  Future login ({ Map credentials }) async {
    _isAuthenticated = true;

    Dio.Response response = await dio().post(
      'auth/token',
      data: json.encode(credentials)
    );
    String token = json.decode(response.toString())['token'];

    await attempt(token);

    notifyListeners();
  }

  Future attempt (String token) async {
    try {
      Dio.Response response = await dio().get(
        'auth/user',
        options: Dio.Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
        )
      );

      debugPrint(response.toString());
    } catch (err) {
      //
    }
  }

  void logout () {
    _isAuthenticated = false;

    notifyListeners();
  }
}