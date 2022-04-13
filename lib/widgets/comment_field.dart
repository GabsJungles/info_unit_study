import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentField extends StatefulWidget {
  const CommentField({Key? key}) : super(key: key);

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  final commentController = TextEditingController();
  String? UserId;
  String? nickname;

  CollectionReference userRef = FirebaseFirestore.instance.collection('post');
  sendComment() async {
    var docComment = userRef.doc().collection('comments').doc();
    
    docComment.set({
      'comment': commentController.text.trim(),
      'postId': UserId,
      'nickname': nickname,
      "id": docComment.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: commentController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'Comente sobre isso...',
          suffixIcon: IconButton(
              onPressed: () async {
                if (commentController.text.isNotEmpty) {
                  sendComment();
                  commentController.clear();
                }
              },
              icon: const Icon(Icons.send, color: Colors.black)),
        ));
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
