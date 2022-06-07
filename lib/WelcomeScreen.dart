import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.lightBlueAccent, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
  }

  @override
  void dispose() {
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
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/PROJECT.png'),
                    height: 120.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Expressify'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }, child: Text(
                  "Register",
                  style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold)
                ),
              style: ElevatedButton.styleFrom(shadowColor: Colors.black,primary:  Colors.lightBlueAccent,
                  elevation: 10,padding: EdgeInsets.all(15),side:BorderSide(color:Colors.white24 ), shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ) ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Login',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
                style: ElevatedButton.styleFrom(shadowColor: Colors.black,primary:  Colors.lightBlueAccent,
                    elevation: 10,padding: EdgeInsets.all(15),side:BorderSide(color:Colors.white24 ), shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ) ),
            ),
          ],
        ),
      ),
    );
  }
}
