import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../models/show messages/show_comments.dart';

class CommentField extends StatefulWidget {
  final PostModel post;
  const CommentField({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  final commentController = TextEditingController();
  String? nickname;
  String? postId;
  final storeMessage = FirebaseFirestore.instance;
  TextEditingController post = TextEditingController();
  CollectionReference userRef = FirebaseFirestore.instance.collection('post');

  @override
  void initState() {
    super.initState();
    getNickname();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            controller: commentController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF8F00FF)),
                      ),
              hintText: 'Comente sobre isso...',
              suffixIcon: IconButton(
                  onPressed: () async {
                    if (commentController.text.isNotEmpty) {
                        final postDoc = storeMessage.collection("post").doc(widget.post.id).collection('comments').doc();
                        await postDoc.set({
                          "comment": commentController.text.trim(),
                          "time": DateTime.now(),
                          "nickname": nickname,
                        });
                        await postDoc.update({
                          "postId": widget.post,
                        });
                        post.clear();
                        commentController.clear();
                      } 
                    },
                  
                  icon: const Icon(Icons.send, color: Colors.black)),
            )),
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          reverse: true,
          child: ShowComments(postId:widget.post.id),
        ),
      ],
    );
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

//    dynamic data;
// Future<void> getPostId() async {
//   // var currentPost = FirebaseFirestore.instance;
//     final DocumentReference document =
//         FirebaseFirestore.instance.collection("post").doc();
//     await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
//       Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
//       setState(() {
//         postId = data['id'];
//       });
//     });
// }

}

 