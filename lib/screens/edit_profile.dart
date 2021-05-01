import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:vigour/user_data.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = "";
  String _lastName = "";
  String _contactNumber = "";

  _updateUserData() {
    Map<String, dynamic> userData = Map<String, dynamic>();
    userData["firstName"] = _firstName;
    userData["lastName"] = _lastName;
    userData["contact"] = _contactNumber;

    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .set(userData, SetOptions(merge: true))
        .then((_) {
      firstName = _firstName;
      lastName = _lastName;
      contactNumber = _contactNumber;
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _firstName = firstName;
    _lastName = lastName;
    _contactNumber = contactNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 32, color: Colors.red),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
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
                            initialValue: _firstName,
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
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
                            initialValue: _lastName,
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
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
                    child: TextFormField(
                      initialValue: _contactNumber,
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
                          _updateUserData();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please fill all the details")));
                        }
                      },
                      buttonText: "Update",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
