import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';

class ConfirmBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                    Icons.sports_football,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Football",
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
