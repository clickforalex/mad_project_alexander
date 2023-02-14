import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/EditProfile.dart';
import 'package:mad_project_alexander/Screens/Feedback.dart';
import 'package:mad_project_alexander/services/firebaseauth_service.dart';

import 'HomePage.dart';

class LoginProfile extends StatefulWidget {
  final String usernamevalue;
  final String passwordvalue;
  final String emailvalue;

  LoginProfile(
      {Key key, this.usernamevalue, this.passwordvalue, this.emailvalue})
      : super(key: key);
  @override
  State<LoginProfile> createState() => ProfileState();
}

class ProfileState extends State<LoginProfile> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0DB),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.account_box,
              size: 200,
              color: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 15),
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "General",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Share Feedback",
                    style: TextStyle(fontSize: 15),
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const FeedbackDialog());
              },
            ),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Info",
                    style: TextStyle(fontSize: 15),
                  )),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            GestureDetector(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 15),
                  )),
              onTap: () async {
                await FirebaseAuthService().signOut();
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
