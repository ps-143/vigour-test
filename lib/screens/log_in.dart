import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:vigour/comp/input_fields.dart';

import 'home.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black38,
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(
          "LogIn",
          style: TextStyle(
            color: Colors.red,
            fontSize: 34,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Register(),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  // final _firstNameFocusNode = FocusNode();

  String _email = "", _password = "";

  _logIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((userCred) {
      if (userCred.user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid email or password')));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                filled: true,
                fillColor: Color.fromRGBO(237, 238, 239, 1),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    color: Color.fromRGBO(237, 238, 239, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    color: Color.fromRGBO(237, 238, 239, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please fill email id";
                }
                return null;
              },
              onChanged: (value) {
                if (this.mounted)
                  setState(() {
                    _email = value;
                  });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: TextFormField(
              obscureText: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                filled: true,
                fillColor: Color.fromRGBO(237, 238, 239, 1),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    color: Color.fromRGBO(237, 238, 239, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    color: Color.fromRGBO(237, 238, 239, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please fill password";
                }
                return null;
              },
              onChanged: (value) {
                if (this.mounted)
                  setState(() {
                    _password = value;
                  });
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PrimaryButton(
              width: MediaQuery.of(context).size.width * 0.45,
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _logIn();
                }
              },
              buttonText: "LogIn",
            ),
          ),
        ],
      ),
    );
  }
}
