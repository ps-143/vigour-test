import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';

class ParticipateForm extends StatelessWidget {
  const ParticipateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(children: [
          Text(
            "Cricket Tournament Registration Form",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
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

class MyDropdownField extends StatefulWidget {
  const MyDropdownField({
    Key key,
    this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  _MyDropdownFieldState createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<MyDropdownField> {
  List<DropdownMenuItem> dlist = [];
  String _value;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.list.length; i++) {
      dlist.add(
        DropdownMenuItem(
          child: Text(widget.list[i]),
          value: widget.list[i],
        ),
      );
    }
    _value = widget.list[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField(
        items: dlist,
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
        onChanged: (v) {
          if (this.mounted) {
            setState(() {
              _value = v;
            });
          }
        },
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key key,
    this.hintText,
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        cursorColor: Colors.red,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: Color.fromRGBO(237, 238, 239, 1),
          hintText: this.hintText,
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
      ),
    );
  }
}
