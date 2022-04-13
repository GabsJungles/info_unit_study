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
    _formKey.currentState!.save();

    var doc = userRef.doc('post');
    doc.set({
      'comment': comments,
      'postId': UserId,
    });
    
    var docComment = userRef.doc('comments');
    doc.set({
      'comment': comments,
      'postId': UserId,
      'nickname': nickname,
      "id": docComment.id, 
    });
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  String? UserId;
  String? nickname;

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

  dynamic data;
Future<void> getUserId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("post").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        UserId = data['id'];
      });
    });
  }

Future<void> getNickname() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        nickname = data['nickname'];
      });
    });
  }
}
