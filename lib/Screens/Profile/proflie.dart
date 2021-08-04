import 'package:burgerjoint/Screens/Profile/UserSignIn/login.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //SEND USER TO LOGIN IF SHARED PREFERENCE EQUALS NULL
    return Login();
  }
}
