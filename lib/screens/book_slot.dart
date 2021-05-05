import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:vigour/screens/slot.dart';

class BookSlot extends StatefulWidget {
  @override
  _BookSlotState createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
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
            "Aghaa Club, BHEL",
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
              "Cricket",
              style: TextStyle(
                color: Colors.red,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
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
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 50,
                              maxHeight: MediaQuery.of(context).size.height),
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 102,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 14,
                                      mainAxisSpacing: 14),
                              itemCount: 7,
                              itemBuilder: (ctx, index) {
                                return BorderButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => Slot(),
                                      ),
                                    );
                                  },
                                  buttonText: "06:00 AM",
                                  textColor: Colors.grey,
                                  borderColor: Colors.grey,
                                );
                              }),
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
