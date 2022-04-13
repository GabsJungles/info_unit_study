import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_post_model.dart';
import 'package:info_unity_study/models/comment_model.dart';
import 'package:info_unity_study/models/format_time.dart';
import 'package:intl/intl.dart';

class CriarComment extends StatefulWidget {
  const CriarComment({
    Key? key,
  }) : super(key: key);

  @override
  State<CriarComment> createState() => _CriarCommentState();
}

class _CriarCommentState extends State<CriarComment> {
  @override
  void initState() {
    super.initState();
    getNickname();
  }

  String? nickname;
  final storeMessage = FirebaseFirestore.instance;
  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final TextField _commentField = TextField(
      controller: comment,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                if (comment.text.isNotEmpty) {
                  storeMessage.collection("comments").doc().set({
                    "comment": comment.text.trim(),
                    "nickname": nickname,
                  });
                  comment.clear();
                }
              },
              icon: Icon(Icons.send, color: Colors.black)),
          hintText: 'Comente sobre isso...',
          hintStyle: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          )),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: 200,
              height: 50,
              child: _commentField,
            ),
          ],
        ),
        SingleChildScrollView(
          physics: ScrollPhysics(),
          reverse: true,
          child: CommentMessages(),
        ),
      ],
    );
  }

  dynamic data;
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
