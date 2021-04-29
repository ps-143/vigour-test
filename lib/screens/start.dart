import 'package:flutter/material.dart';
import 'package:vigour/comp/buttons.dart';

class Start extends StatelessWidget {
  const Start({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(),
              flex: 2,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ace\nYour Goal",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Let's start with your interests",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BorderButton(
                        width: MediaQuery.of(context).size.width,
                        buttonText: "Practice",
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.2),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      PrimaryButton(
                        width: MediaQuery.of(context).size.width,
                        buttonText: "Participate",
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.2),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
