import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vigour/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Vigour(),
    ),
  );
}

class Vigour extends StatefulWidget {
  const Vigour({Key key}) : super(key: key);

  @override
  _VigourState createState() => _VigourState();
}

class _VigourState extends State<Vigour> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
