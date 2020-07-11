import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishapp/components/categorycard.dart';
import 'package:fishapp/screens/adminhome.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;


class UserHome extends StatefulWidget {
  static String id = 'UserHome' ;

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  final _auth = FirebaseAuth.instance;
 // String email = "";

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
       // email = loggedInUser.email;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image_coursel = new Container(
      height: 230.0,
      child: new Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('images/c1.png'),
          AssetImage('images/c2.png'),
          AssetImage('images/c3.png'),
          AssetImage('images/c4.png'),
          AssetImage('images/c5.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 8,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xfffece2f),
        title: Center(child: Text('Fish App',style: TextStyle(color: Colors.black , fontWeight: FontWeight.w900),)),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart), color: Colors.black ,onPressed: (){
          }),
          new IconButton(icon: Icon(Icons.add_to_home_screen), color: Colors.black ,onPressed: (){
              _auth.signOut();
              Navigator.pop(context);
          }),
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Username'),
              accountEmail: Text('email'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person,color: Colors.black54,),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color(0xfffece2f),
              ),
            ),
            // body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home,color: Color(0xfffece2f),),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.person,color: Color(0xfffece2f),),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_basket,color: Color(0xfffece2f),),
              ),
            ),

            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Color(0xfffece2f),),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourities'),
                leading: Icon(Icons.favorite,color: Color(0xfffece2f),),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.black54,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.black54,),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          image_coursel,
          SingleChildScrollView(
            child: Container(
              height: 300.0,
              child: Column(
                children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CategoryCard(
                            title: "Fish",
                            svgSrc: "images/ic1.png",
                            press: () {},
                          ),
                        ),
                        Expanded(
                          child: CategoryCard(
                            title: "Crabs",
                            svgSrc: "images/ic2.png",
                            press: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CategoryCard(
                            title: "Lobster",
                            svgSrc: "images/ic3.png",
                            press: () {},
                          ),
                        ),
                        Expanded(
                          child: CategoryCard(
                            title: "Prawns",
                            svgSrc: "images/ic4.png",
                            press: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[

                        Expanded(
                          child: CategoryCard(
                            title: "SeaShell",
                            svgSrc: "images/ic5.png",
                            press: () {},
                          ),
                        ),
                        Expanded(
                          child: CategoryCard(
                            title: "Octopus",
                            svgSrc: "images/ic6.png",
                            press: () {},
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


