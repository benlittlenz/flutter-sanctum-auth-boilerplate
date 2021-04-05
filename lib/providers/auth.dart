
import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/dio.dart';
import 'package:flutter_sanctum_boilerplate/models/user.dart';
import 'package:platform_device_id/platform_device_id.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;
  User _user;

  bool get authenticated => _isAuthenticated;
  User get user => _user;

  Future login ({ Map credentials }) async {
    Dio.Response response = await dio().post(
      'auth/token',
      data: json.encode(credentials)
    );
    String token = json.decode(response.toString())['token'];

    await attempt(token);
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
      _user = User.fromJson(json.decode(response.toString()));
      _isAuthenticated = true;
    } catch (err) {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  Future getDeviceId () async {
    String deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (err) {
      //
    }

    return deviceId;
  }

  void logout () {
    _isAuthenticated = false;

    notifyListeners();
  }
}