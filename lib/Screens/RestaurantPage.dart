import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Model/restaurantInfo.dart';
import 'package:mad_project_alexander/services/firestore_restaurant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RestaurantRecordsPage extends StatefulWidget {
  @override
  _RestaurantRecordsPageState createState() => _RestaurantRecordsPageState();
}

class _RestaurantRecordsPageState extends State<RestaurantRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back ' +
            FirebaseAuth.instance.currentUser.email.split('@').first +
            "!"),
        backgroundColor: Colors.black38,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: FirestoreRestaurantService().readRestaurantData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].address,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('images/' +
                                        snapshot.data[0].restaurantImage))),
                          ),
                          Text(
                            snapshot.data[index].name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].restaurantImage,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
} //_RecordsPageState
