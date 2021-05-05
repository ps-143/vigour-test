import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';
import 'package:vigour/screens/practice.dart';

class ConfirmBook extends StatelessWidget {
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
          "Booking Confirm",
          style: TextStyle(
            fontSize: 34,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 50.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Icon(
                    Icons.calendar_today,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "24th March, 2021",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text("Tomorrow"),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 1,
              color: Colors.black45,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "BHEL Sports Club",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text("Preffered Location"),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 1,
              color: Colors.black45,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Icon(
                    Icons.sports_cricket,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Cricket",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: PrimaryButton(
        buttonText: "Done",
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width * 0.35,
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
