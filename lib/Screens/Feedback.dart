import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mad_project_alexander/Screens/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackForm extends StatefulWidget {
  FeedbackForm({Key key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback form'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open form'),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
      ),
    );
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 500,
          textInputAction: TextInputAction.done,
          validator: (String text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          style: TextButton.styleFrom(
            primary: Colors.black, // Text Color
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          style: TextButton.styleFrom(
            primary: Colors.black, // Text Color
          ),
          onPressed: () async {
            // Only if the input form is valid (the user has entered text)
            if (_formKey.currentState.validate()) {
              // We will use this var to show the result
              // of this operation to the user
              String message;

              try {
                // Get a reference to the `feedback` collection
                final collection =
                    FirebaseFirestore.instance.collection('feedback');

                // Write the server's timestamp and the user's feedback
                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'feedback': _controller.text,
                });

                message = 'Feedback sent successfully';
              } catch (e) {
                message = 'Error when sending feedback';
              }
              Fluttertoast.showToast(msg: message, gravity: ToastGravity.TOP);
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
