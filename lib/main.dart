import 'package:expressify/confessions.dart';
import 'package:expressify/mentalhealth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';
import 'WelcomeScreen.dart';
import 'ServerScreen.dart';
import 'ChatScreen.dart';
import 'confessions.dart';
import 'mentalhealth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ServerScreen.id : (context) => ServerScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        MentalHealthScreen.id: (context) => MentalHealthScreen(),
    ConfessionScreen.id: (context) => ConfessionScreen()
      },
    );
  }
}
