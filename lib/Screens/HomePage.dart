import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/About.dart';
import 'package:mad_project_alexander/Screens/BookingRecords.dart';
import 'package:mad_project_alexander/Screens/Community.dart';
import 'package:mad_project_alexander/Screens/Profile.dart';
import 'package:mad_project_alexander/Screens/RestaurantPage.dart';
import 'ProductPage.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  int _currentIndex = 0;
  final List _children = [
    About(),
    ProductPage(),
    RecordsPage(),
    Community(),
    LoginProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.info),
            backgroundColor: Colors.black,
            title: new Text('About'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: new Icon(Icons.auto_stories),
            title: new Text('Bookings'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: new Icon(Icons.chat_bubble_rounded),
            title: new Text('Community'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.person),
              title: Text('Profile'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
