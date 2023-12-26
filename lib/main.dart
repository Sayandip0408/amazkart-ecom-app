import 'dart:async';

import 'package:amazkart/screens/homeScreen.dart';
import 'package:amazkart/screens/onboardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmazKart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    if(_auth.currentUser != null){
      Timer(const Duration(seconds: 1),
              ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen() )));
    }
    else{
      Timer(const Duration(seconds: 1),
              ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const OnBoardingScreen() )));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: Image.asset("images/splash.png"),
      ),
    );
  }
}
