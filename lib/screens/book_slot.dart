import 'package:flutter/material.dart';
import 'package:customtogglebuttons/customtogglebuttons.dart';

class BookSlot extends StatefulWidget {
  @override
  _BookSlotState createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _isSelected.addAll([
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          title: Text(
            "BHEL Sports Club",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 45, right: 45, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Basketball",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sun, 24 March",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomToggleButtons(
                          isSelected: _isSelected,
                          spacing: 5,
                          runSpacing: 5,
                          borderWidth: 1,
                          renderBorder: true,
                          selectedColor: Colors.white,
                          fillColor: Colors.red,
                          children: <Widget>[
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "06:00 AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                          onPressed: (index) {
                            setState(() {
                              _isSelected[index] = !_isSelected[index];
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
