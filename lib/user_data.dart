import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String firstName = "";
String lastName = "";
String email = "";
String contactNumber = "";
String gender = "";

fetchUserData() {
  email = FirebaseAuth.instance.currentUser.email;
  FirebaseFirestore.instance.collection("users").doc(email).get().then((ss) {
    firstName = ss["firstName"];
    lastName = ss["lastName"];
    contactNumber = ss["contact"];
    gender = ss["gender"];
  });
}
