import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/AddBookings.dart';

import '../class.dart';

class DetailPage extends StatefulWidget {
  final int index;
  final String imgPath;
  final String restaurantName;
  final String restaurantDetails;
  final int photo;
  DetailPage(
      {Key key,
      @required this.index,
      @required this.imgPath,
      @required this.restaurantName,
      @required this.restaurantDetails,
      @required this.photo})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final diningOptions = [
    'Takeaway',
    'Dining in',
  ];
  String dropdownvalue = 'Choose a dining option';
  int counter = 0;
  bool size = false;
  bool quantity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
        backgroundColor: Colors.black45,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            child: Hero(
              tag: widget.photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Image(
                    image: AssetImage(widget.imgPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.restaurantName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Dining: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              DropdownButton(
                hint: Text(dropdownvalue),
                icon: const Icon(Icons.arrow_drop_down),
                items: diningOptions.map((String e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                    size = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Number Of Pax: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    counter++;
                    if (counter > 0) {
                      quantity = true;
                    }
                  });
                },
              ),
              SizedBox(
                width: 20,
              ),
              Text(this.counter.toString()),
              SizedBox(
                width: 20,
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (counter > 0) {
                    setState(() {
                      counter--;
                      if (counter > 0) {
                        quantity = true;
                      } else {
                        quantity = false;
                      }
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  v.diningOptions = dropdownvalue.toString();
                  v.pax = counter.toString();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddRecordPage(
                                diningoption: dropdownvalue,
                                pax: counter,
                              )));
                },
              ),
            )
          ]),
        ],
      ),
    );
  }
}
