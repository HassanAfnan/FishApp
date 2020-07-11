import 'package:fishapp/screens/login.dart';
import 'package:fishapp/screens/signup.dart';
import 'package:fishapp/screens/userhome.dart';
import 'package:fishapp/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(FishApp());

class FishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xfffece2f),
      ),
      title: 'Fish App',
      debugShowCheckedModeBanner: false,
       initialRoute: Welcome.id,
       routes: {
         Welcome.id: (context) => Welcome(),
         Login.id: (context) => Login(),
         Signup.id: (context) => Signup(),
         UserHome.id: (context) => UserHome()
       },
    );
  }
}
