import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vigour/image_res.dart';
import 'package:vigour/screens/book_slot.dart';
import 'package:vigour/screens/grounds.dart';

class Practice extends StatelessWidget {
  Practice({Key key}) : super(key: key);
  final List<Map<String, String>> sl = [
    {"Cricket": cricket},
    {"Football": football},
    {"Badminton": badmiton},
    {"Hockey": hockey},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: sl.length,
              options: CarouselOptions(
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {}),
              itemBuilder: (context, index, x) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) {
                        return Grounds();
                      }),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 300,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          sl[index].values.first,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${sl[index].keys.first}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
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
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return BookSlot();
                        },
                      ),
                    );
                  },
                  child: Container(
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
