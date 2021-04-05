
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;

  void login ({ Map credentials }) {
    _isAuthenticated = true;

    notifyListeners();
  }
}