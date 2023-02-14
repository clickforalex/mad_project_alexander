import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/HomePage.dart';
import 'package:mad_project_alexander/services/firebaseauth_service.dart';

import '../class.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool signUp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 00,
              left: 10,
              right: 10,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () {},
            child: signUp
                ? Text(
                    "Sign up for free!",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  )
                : Text(
                    "Welcome Back!",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 00,
              right: 00,
              top: 5,
              bottom: 00,
            ),
          ),
          Image.asset(
            'images/AlexCompanyPic.png',
            height: 210,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                labelText: "Email :",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                labelText: "Password :",
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (signUp) {
                var newuser = await FirebaseAuthService().signUp(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (newuser != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              } else {
                var reguser = await FirebaseAuthService().signIn(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (reguser != null) {
                  v.email = emailController.text.trim();
                  v.password = passwordController.text.trim();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
              }
            },
            child: signUp ? Text("Sign Up") : Text("Sign In"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () {
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp
                ? Text(
                    "Already a member? Sign In",
                    style: TextStyle(color: Colors.black),
                  )
                : Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ],
      ),
    );
  }
}
