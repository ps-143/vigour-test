import 'package:flutter/material.dart';
import 'package:vigour/image_res.dart';
import 'package:vigour/screens/book_slot.dart';

class Grounds extends StatefulWidget {
  @override
  _GroundsState createState() => _GroundsState();
}

class _GroundsState extends State<Grounds> {
  ScrollController _scrollController;
  double _toolbarExpandedHeight = 220;
  double _toolbarCollapsedHeight = 50;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent &&
          this.mounted) {
        setState(() {
          _isCollapsed = false;
        });
      } else if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          this.mounted) {
        setState(() {
          _isCollapsed = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                titleSpacing: 0,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _isCollapsed ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  child: Text(
                    'Cricket',
                    style: TextStyle(
                        color: _isCollapsed ? Colors.red : Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                expandedHeight: _toolbarExpandedHeight,
                toolbarHeight: _toolbarCollapsedHeight,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 0,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: Container(
                      padding: EdgeInsets.only(bottom: 16),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            cricket,
                          ),
                        ),
                      ),
                    )),
              ),
            ];
          },
          body: ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return InkWell(
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
                    margin: EdgeInsets.only(
                        bottom: 18, left: 50, right: 50, top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            cricket,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cricket",
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
              })),
    );
  }
}
