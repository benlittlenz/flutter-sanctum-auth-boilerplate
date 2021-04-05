import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/screens/login-screen.dart';
import 'package:flutter_sanctum_boilerplate/screens/posts-screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('User Name'),
          ),
          ListTile(
            title: Text('Posts'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => PostScreen()));
            }
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginScreen()));
            }
          ),
        ],
      ),
    );
  }
}
