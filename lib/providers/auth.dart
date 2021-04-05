
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get authenticated => _isAuthenticated;

  void login ({ Map credentials }) {
    _isAuthenticated = true;

    notifyListeners();
  }

  void logout () {
    _isAuthenticated = false;

    notifyListeners();
  }
}