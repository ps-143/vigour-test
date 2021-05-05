import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:vigour/comp/input_fields.dart';

class ParticipateForm extends StatelessWidget {
  const ParticipateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(
          "Cricket Tournament Registration Form",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Register(),
        ]),
      ),
      floatingActionButton: PrimaryButton(
        buttonText: "Done",
        margin: const EdgeInsets.only(bottom: 30),
        height: 48,
        width: MediaQuery.of(context).size.width * 0.5,
        onPressed: () {
          int count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
  String _value = "Male";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyTextFormField(
                  hintText: "First Name",
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MyTextFormField(
                  hintText: "Last Name",
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MyDropdownField(
            list: [
              "Male",
              "Female",
              "Other",
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MyTextFormField(
            hintText: "Contact Number",
          ),
        ],
      ),
    );
  }
}
