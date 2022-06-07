import 'package:firebase_auth/firebase_auth.dart';
import 'package:expressify/ChatScreen.dart';
import 'package:expressify/confessions.dart';
import 'package:expressify/mentalhealth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String n1="MENTAL HEALTH DISCUSSION";
String n2="OPEN GLOBAL CHAT";
String n3="CONFESSION TIME";
class ServerScreen extends StatefulWidget {
  static const String id = 'ServerScreen';
  @override
  _ServerScreenState createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();;
                  Navigator.pop(context);
                }),
          ],

          backgroundColor: Colors.cyanAccent,
        ),
            body: Container(decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/imagee.png'),
                  fit: BoxFit.cover),

            ),constraints: BoxConstraints.expand(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(mainAxisAlignment:MainAxisAlignment.center,children:<Widget>[
                SERVERICON(n1,MentalHealthScreen.id),
                  SizedBox(height: 30,),
                  SERVERICON(n2,ChatScreen.id),
                  SizedBox(height: 30),
                  SERVERICON(n3 ,ConfessionScreen.id),




                  ]),
              ),


            )));
  }
}

class SERVERICON extends StatelessWidget {
  String input;
  String id;
  SERVERICON(String values , String route)
{
  input=values;
  id=route;
}
  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        child: Text('$input',
            style: TextStyle(  // Colors.lightBlueAccent
                color: Colors.black, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(shadowColor:Colors.white24,primary:Colors.lightBlueAccent,
            elevation: 10,padding: EdgeInsets.all(15),side:BorderSide(color:Colors.white24 ), shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ) ),
        onPressed: (){
          Navigator.pushNamed(context, '$id');
        },

      )
    ;
  }
}
