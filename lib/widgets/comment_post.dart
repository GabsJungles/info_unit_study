import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommentPost extends StatefulWidget {
  const CommentPost({
    Key? key,
  }) : super(key: key);

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  var username = ' ';

  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  final _formKey = GlobalKey<FormState>();
  late String comments = ' ';

  sendComment() async {
    final isValid = _formKey.currentState!.validate();
    final name = user!.displayName;

    var res = await userRef.where('userid', isEqualTo: user!.uid).get();

    _formKey.currentState!.save();

    var doc = userRef.doc('post');
    doc.set({
      'comment': comments,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                            labelText: "Comente sobre isso...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                        onSaved: (value) {
                          comments = value!;
                        }),
                  )
                ],
              )),
          ElevatedButton.icon(
              onPressed: sendComment,
              icon: const Icon(
                Icons.send,
                color: Colors.black,
              ),
              label: const Text("Send"))
        ],
      )),
    );
  }
}
