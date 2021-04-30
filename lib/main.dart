import 'package:flutter/material.dart';
import 'package:vigour/screens/confirm.dart';
import 'package:vigour/screens/participate.dart';
import 'package:vigour/screens/participate_form.dart';
import 'package:vigour/screens/practice.dart';
import 'package:vigour/screens/slot.dart';
// import 'package:vigour/screens/participate.dart';
// import 'package:vigour/screens/practice.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Vigour(),
      ),
    );

class Vigour extends StatefulWidget {
  const Vigour({Key key}) : super(key: key);

  @override
  _VigourState createState() => _VigourState();
}

class _VigourState extends State<Vigour> {
  List<Widget> _pages = [];
  List<Widget> _appBarTitle = [];
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pages.addAll([
      Participate(),
      Practice(),
      Container(),
    ]);
    _appBarTitle.addAll([
      ListTile(
        title: Text(
          "Upcoming",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22,
          ),
        ),
        subtitle: Text(
          "Tournaments",
          style: TextStyle(
            color: Colors.red,
            fontSize: 34,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      Text(
        "Let's Go",
        style: TextStyle(
          color: Colors.red,
          fontSize: 34,
          fontWeight: FontWeight.w900,
        ),
      ),
      Text(
        "Profile",
        style: TextStyle(
          color: Colors.red,
          fontSize: 34,
          fontWeight: FontWeight.w900,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _appBarTitle[_currentPage],
        ),
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.redAccent,
          currentIndex: _currentPage,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(240, 240, 255, 1),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Participate",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Practice",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onTap: (i) {
            if (this.mounted) {
              setState(() {
                _currentPage = i;
              });
            }
          },
        ),
      ),
    );
  }
}
