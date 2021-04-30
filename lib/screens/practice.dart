import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Practice extends StatelessWidget {
  const Practice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 10,
              options: CarouselOptions(
                  viewportFraction: 0.5,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {}),
              itemBuilder: (context, index, x) {
                return Container(
                    width: 200,
                    height: 300,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1545809074-59472b3f5ecc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                            )),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'text $index',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ));
              },
            )),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            "Recently Viewed",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1545809074-59472b3f5ecc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lawn Tennis",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Aghaa Club, BHEL",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
