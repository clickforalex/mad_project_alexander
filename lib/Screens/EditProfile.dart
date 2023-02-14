import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String username;
  String userEmail;
  String userPhone;
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
  }

  void getData() async {}

  void validateDetail() {
    if (_key.currentState.validate()) {
      updateProfile();
      // updateLoginPhone();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginProfile()));
    }
  }

  Future updateProfile() async {
    updateUserDetails(
      nameController.text.trim(),
      emailController.text.trim(),
      int.parse(phoneController.text.trim()),
    );
  }

  Future updateUserDetails(String username, String email, int phoneNum) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('cSAHt8sm1fd6b9vP0kJX')
        .set({'username': username, 'email': email, 'phoneNum': phoneNum});
  }

  Stream<DocumentSnapshot> snapshot = FirebaseFirestore.instance
      .collection("users")
      .doc('cSAHt8sm1fd6b9vP0kJX')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Icon(
                    Icons.chevron_left,
                    size: 18,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        )),
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Color(0xffefefef),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // SizedBox
                          TextFormField(
                            maxLength: 8,
                            controller: phoneController,
                            validator: validatePhone,
                            keyboardType: TextInputType.number,
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                              hintText: v.mobile,
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff0490ff),
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: validateEmail,
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                  hintText: v.email,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff0490ff),
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: nameController,
                                //validator: validateName,
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                  hintText: v.name,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff0490ff),
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        v.email = emailController.text.trim();
                        v.name = nameController.text.trim();
                        v.mobile = phoneController.text.trim();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginProfile(),
                            ));
                      },
                      child: const Text(
                        "Save changes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String validatePhone(String validateInput) {
  String pattern = r'(^([6,8,9]{1})?[0-9]{7}$)';
  RegExp regex = RegExp(pattern);
  if (validateInput == null || validateInput.isEmpty) {
    return 'Phone is required.';
  } else if (!regex.hasMatch(validateInput)) {
    return 'Invalid number format.';
  } else {
    return null;
  }
}

String validateEmail(String validateInput) {
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (validateInput == null || validateInput.isEmpty) {
    return 'Email address is required.';
  } else if (!regex.hasMatch(validateInput)) {
    return 'Invalid email address format.';
  } else {
    return null;
  }
}

String validateName(String validateInput) {
  if (validateInput == null || validateInput.isEmpty) {
    return 'Name is required.';
  } else if (validateInput.length > 16) {
    return 'Name character must be less than 17.';
  } else if (validateInput.length < 3) {
    return 'Name character must be more than 2.';
  } else {
    return null;
  }
}

String phonePadding() {
  return "const EdgeInsets.symmetric(horizontal: 20),";
}

String clearPhonePadding() {
  return "const EdgeInsets.symmetric(horizontal: 0),";
}
