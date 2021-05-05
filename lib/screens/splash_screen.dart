import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vigour/image_res.dart';
import 'package:vigour/screens/home.dart';
import 'package:vigour/screens/start.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _initFirebaseAuth() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => Start()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => Home()));
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initFirebaseAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Image.asset(appIcon),
      ),
    );
  }
}
