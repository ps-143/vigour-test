import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Practice extends StatelessWidget {
  const Practice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.2,
            height: 200.0,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Recently Viewed",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Container(
                  child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1617883861744-13b534e3b928?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Lawn Tennis",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black54,
                      ),
                    ),
                    subtitle: Text(
                      "Aghaa Club, BHEL",
                    ),
                  )
                ],
              ));
            },
          ),
        )
      ],
    );
  }
}
