import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Model/Bookings.dart';
import 'package:mad_project_alexander/Screens/BookingRecords.dart';
import 'package:mad_project_alexander/Screens/ProductPage.dart';
import 'package:mad_project_alexander/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../class.dart';

class AddRecordPage extends StatefulWidget {
  final String diningoption;
  final int pax;
  AddRecordPage({Key key, @required this.diningoption, @required this.pax})
      : super(key: key);

  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String bookAuthor;
  String bookTitle;
  String bookDescription;
  String diningoption;
  int pax;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
        actions: <Widget>[],
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: v.diningOptions),
                  validator: (val) =>
                      val.length != 0 ? "Please select a dining Option" : null,
                  onSaved: (val) => this.bookAuthor = v.diningOptions,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: v.pax),
                  validator: (val) =>
                      val.length != 0 ? 'Please select Number of Pax' : null,
                  onSaved: (val) => this.bookTitle = v.pax,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Enter Timing'),
                  validator: (val) =>
                      val.length == 0 ? 'Please enter a timing' : null,
                  onSaved: (val) => this.bookDescription = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Confirm Booking'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RecordsPage()));
    } else {
      return null;
    }
    FirestoreService().addBookingData(bookAuthor, bookTitle, bookDescription);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState
