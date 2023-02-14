import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project_alexander/Model/Users.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUserData(
      String username, String userEmail, int userPhone) async {
    var docRef = FirestoreService().usersCollection.doc();
    print('add docRef: ' + docRef.id);
    await usersCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'username': username,
      'email': userEmail,
      'phoneNum': userPhone
    });
  } //

  // Future<List<UserDetails>> readUserData() async {
  //   List<UserDetails> userList = [];
  //   QuerySnapshot snapshot = await usersCollection.get();
  //   snapshot.docs.forEach((document) {
  //     UserDetails users = UserDetails.fromMap(document.data());
  //     userList.add(users);
  //   });
  //   print('UserList: $userList');
  //   return userList;
  // } //readBookingData

  Future<void> deleteUserData(String docId) async {
    usersCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteUserData

  //for your reference
  Future<void> updateUserData(
      String username, String userEmail, String userPhone) async {
    var docRef = FirestoreService().usersCollection.doc();
    print('update docRef: ' + docRef.id);
    await usersCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'username': username,
      'email': userEmail,
      'phoneNum': userPhone
    });
  } //updateUserData

  //for your reference
  Future<void> deleteUserDoc() async {
    await usersCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  readBookingData() {} //deleteUserDoc
} //Fir
