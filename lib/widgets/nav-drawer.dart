import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/providers/auth.dart';
import 'package:flutter_sanctum_boilerplate/screens/login-screen.dart';
import 'package:flutter_sanctum_boilerplate/screens/jobs-screen.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
      if (auth.authenticated) {
        return ListView(
          children: [
            ListTile(
              title: Text(auth.user.name),
            ),
            ListTile(
                title: Text('Jobs'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JobScreen()));
                }),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  Provider.of<Auth>(context, listen:false).logout();
                }),
          ],
        );
      } else {
        return ListView(
          children: [
            ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
            ListTile(
                title: Text('Register'),
                onTap: () {
                }),
          ],
        );
      }
    }));
  }
}
