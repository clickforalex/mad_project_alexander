import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/HomePage.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  // var location = new Location();
  // LocationData userLocation;
  // Future<LocationData> _getLocation() async {
  //   LocationData currentLocation;
  //   try {
  //     currentLocation = await location.getLocation();
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }

  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'WELCOME TO EZFOOD',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: Image.asset('images/AlexCompanyPic.png'),
            ),
            Container(
              child: Text(
                '\'Bookings made easier with us\'',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 330,
              child: Text('About the Company',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 330,
              child: Text(
                  'EZFOOD is an online food platform owned by LX Company. EZFOOD operates as the lead brand for discovering restaurants in Asia, with its headquarters in Singapore. It is currently the largest Restuarant reccomendation platform in Asia, outside of China, operating in 12 markets across Asia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 330,
              child: Text('Developer',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 330,
              child: Text('Alexander Ang 201906L',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: FlatButton(
                child: Text(
                  'Email: EZFOODSG@gmail.com',
                  style: TextStyle(fontSize: 15),
                ),
                color: Colors.black38,
                textColor: Colors.white,
                onPressed: () {
                  launch(
                      "mailto:<email address>?subject=<subject>&body=<body>");
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: FlatButton(
                child: Text(
                  'Address: 180 Ang Mo Kio Ave 8, Singapore 569830',
                  style: TextStyle(fontSize: 15),
                ),
                color: Colors.black38,
                textColor: Colors.white,
                onPressed: () => MapsLauncher.launchQuery(
                    '180 Ang Mo Kio Ave 8, Singapore 569830'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: FlatButton(
                child: Text(
                  'Phone: +65 93223042',
                  style: TextStyle(fontSize: 15),
                ),
                color: Colors.black38,
                textColor: Colors.white,
                onPressed: () {
                  launch("tel:93223042");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
