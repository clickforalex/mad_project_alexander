import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Model/Bookings.dart';
import 'package:mad_project_alexander/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserRecordPage extends StatefulWidget {
  @override
  _UserRecordPageState createState() => _UserRecordPageState();
}

class _UserRecordPageState extends State<UserRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<List<Booking>>(
        future: FirestoreService().readBookingData(),
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
                        snapshot.data[index].user,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].restuarant,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreService()
                                .deleteBookingData(snapshot.data[index].bid);
                          });
                          Fluttertoast.showToast(
                              msg: "Data deleted successfully",
                              gravity: ToastGravity.TOP);
                        },
                      )
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
