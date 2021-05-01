import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
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
          "SignUp",
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
  String _firstName = "";
  String _lastName = "";
  String _gender = "";
  String _contactNumber = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  _signInUser() {
    if (_password == _confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signed Up')));
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((userCred) {
        if (userCred.user == null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong!!!')));
        } else {
          Map<String, dynamic> userData = Map<String, dynamic>();
          userData["firstName"] = _firstName;
          userData["lastName"] = _lastName;
          userData["gender"] = _gender;
          userData["contact"] = _contactNumber;
          userData["email"] = _email;
          FirebaseFirestore.instance
              .collection("users")
              .doc(_email)
              .set(userData)
              .then((_) {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Home()));
          });
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Passwords do not match!!!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Color.fromRGBO(237, 238, 239, 1),
                        hintText: "First Name",
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
                          return "Please fill first name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (this.mounted)
                          setState(() {
                            _firstName = value;
                          });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Color.fromRGBO(237, 238, 239, 1),
                        hintText: "Last Name",
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
                          return "Please fill last name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (this.mounted)
                          setState(() {
                            _lastName = value;
                          });
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: Text("Male"),
                    value: "Male",
                  ),
                  DropdownMenuItem(
                    child: Text("Female"),
                    value: "Female",
                  ),
                  DropdownMenuItem(
                    child: Text("Other"),
                    value: "Other",
                  ),
                ],
                hint: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 238, 239, 1),
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
                    return "Please select your gender";
                  }
                  return null;
                },
                onChanged: (v) {
                  if (this.mounted) {
                    setState(() {
                      _gender = v;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 238, 239, 1),
                  hintText: "Contact Number",
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
                    return "Please fill contact number";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (this.mounted)
                    setState(() {
                      _contactNumber = value;
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
                  hintText: "Confirm Password",
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
                      _confirmPassword = value;
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
                    _signInUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all the details")));
                  }
                },
                buttonText: "SignUp",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
