import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mad_project_alexander/Model/Users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mad_project_alexander/Screens/LoginPage.dart';

class FirebaseAuthService {
  // FirebaseAuth instance
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;
  Future<User> signIn({String name, String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print("Signed In successful! userid: $ucred.user.uid, user: $user.");
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signIn

  Future<User> signUp({String name, String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = ucred.user;
      user.updateProfile(displayName: name);
      print('Signed Up successful! user: $user');
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signUp

  Future addUserDetails(String userName, String email, int phoneNum) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': userName,
      'email': email,
      'phoneNum': phoneNum,
    });
  }

  Future<void> signOut() async {
    await _fbAuth.signOut();
  } //signOut
}
