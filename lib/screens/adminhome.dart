import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xfffece2f),
        title: Center(child: Text('Fish App',style: TextStyle(color: Colors.black , fontWeight: FontWeight.w900),)),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.add_to_home_screen), color: Colors.black ,onPressed: (){
            _auth.signOut();
            Navigator.pop(context);
          }),
        ],
      ),
      body: Center(child: Text("Admin Pannel")),
    );
  }
}
