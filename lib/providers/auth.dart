
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get authenticated => authenticated;

  void login ({ Map credentials }) {
    _isAuthenticated = true;

    notifyListeners();
  }
}