import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  MyTextFormField(
      {Key key,
      this.hintText,
      this.obscureText = false,
      this.textEditingController})
      : super(key: key);
  final String hintText;
  final bool obscureText;
  final TextEditingController textEditingController;

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        obscureText: this.widget.obscureText,
        controller: widget.textEditingController,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: Color.fromRGBO(237, 238, 239, 1),
          hintText: this.widget.hintText,
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
            return "Please fill all the fields";
          }
          return null;
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDropdownField extends StatefulWidget {
  MyDropdownField({
    Key key,
    this.list,
    this.fieldValue,
  }) : super(key: key);

  final List<String> list;
  String fieldValue;

  @override
  _MyDropdownFieldState createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<MyDropdownField> {
  List<DropdownMenuItem> dlist = [];
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
        validator: (value) {
          if (value.isEmpty) {
            return "Please select your gender";
          }
          return null;
        },
        onChanged: (v) {
          if (this.mounted) {
            setState(() {
              widget.fieldValue = v;
            });
          }
        },
      ),
    );
  }
}
