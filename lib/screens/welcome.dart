import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fishapp/components/roundbutton.dart';
import 'package:fishapp/screens/login.dart';
import 'package:fishapp/screens/signup.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget{
  static String id = 'welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this
    );

    animation = ColorTween(begin: Colors.black54,end: Color(0xfffece2f)).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                   // color: Colors.black,
                    child: Image.asset('images/fish.png'),
                    height: 60.0,
                  ),
                ),
                TextLiquidFill(
                  text:'Fish App',
                  waveColor: Colors.blue[900],
                  boxHeight: 100.0,
                  boxWidth: 200.0,
                  boxBackgroundColor: Color(0xfffece2f),
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: (){
                Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, Signup.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
