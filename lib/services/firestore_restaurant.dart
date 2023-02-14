import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project_alexander/Model/Bookings.dart';
import 'package:mad_project_alexander/Model/Users.dart';
import 'package:mad_project_alexander/Model/restaurantInfo.dart';

class FirestoreRestaurantService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference bookingsCollection =
      FirebaseFirestore.instance.collection('restaurants');
  Future<void> addBookingData(
      String address,
      String name,
      String numberOfRating,
      String openingHours,
      String rating,
      String restaurantImage) async {
    var docRef = FirestoreRestaurantService().bookingsCollection.doc();
    print('add docRef: ' + docRef.id);
    await bookingsCollection.doc(docRef.id).set({
      'rid': docRef.id,
      'address': address,
      'name': name,
      'numberOfRating': numberOfRating,
      'openingHours': openingHours,
      'rating': rating,
      'restaurantImage': restaurantImage
    });
  } //addBookingData

  Future<List<Restaurant>> readRestaurantData() async {
    List<Restaurant> bookingList = [];
    QuerySnapshot snapshot = await bookingsCollection.get();
    snapshot.docs.forEach((document) {
      Restaurant bookings = Restaurant.fromMap(document.data());
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
    var docRef = FirestoreRestaurantService().bookingsCollection.doc();
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
