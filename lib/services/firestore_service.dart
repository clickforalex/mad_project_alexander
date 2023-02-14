import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project_alexander/Model/Bookings.dart';
import 'package:mad_project_alexander/Model/Users.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference bookingsCollection =
      FirebaseFirestore.instance.collection('bookings');
  Future<void> addBookingData(String bookinguser, String bookingrestuarant,
      String bookingdescription) async {
    var docRef = FirestoreService().bookingsCollection.doc();
    print('add docRef: ' + docRef.id);
    await bookingsCollection.doc(docRef.id).set({
      'bid': docRef.id,
      'user': bookinguser,
      'restuarant': bookingrestuarant,
      'description': bookingdescription
    });
  } //addBookingData

  Future<List<Booking>> readBookingData() async {
    List<Booking> bookingList = [];
    QuerySnapshot snapshot = await bookingsCollection.get();
    snapshot.docs.forEach((document) {
      Booking bookings = Booking.fromMap(document.data());
      bookingList.add(bookings);
    });
    print('UserList: $bookingList');
    return bookingList;
  } //readBookingData

  Future<void> deleteBookingData(String docId) async {
    bookingsCollection.doc(docId).delete();
    print('deleting bid: ' + docId);
  } //deleteUserData

  //for your reference
  Future<void> updateBookData(String bookinguser, String bookingrestuarant,
      String bookDescription) async {
    var docRef = FirestoreService().bookingsCollection.doc();
    print('update docRef: ' + docRef.id);
    await bookingsCollection.doc(docRef.id).update({
      'bid': docRef.id,
      'user': bookinguser,
      'restuarant': bookingrestuarant,
      'description': bookDescription
    });
  } //updateBookData

  //for your reference
  Future<void> deleteBookDoc() async {
    await bookingsCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //Fir
