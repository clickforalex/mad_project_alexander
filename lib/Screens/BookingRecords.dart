import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Model/Bookings.dart';
import 'package:mad_project_alexander/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bookings'),
        backgroundColor: Colors.black38,
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
                        "Dining: " + snapshot.data[index].user,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            "Number of Pax: " + snapshot.data[index].restuarant,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          Text(
                            "Reservation: " + snapshot.data[index].description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.cancel),
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
