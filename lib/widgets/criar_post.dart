import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_post_model.dart';
import 'package:info_unity_study/models/format_time.dart';
import 'package:intl/intl.dart';


class CriarPost extends StatefulWidget {
  const CriarPost({ Key? key,
  }) : super(key: key);

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
   @override
  void initState() {
    super.initState();
    getNickname();
  }
  String? nickname;
final storeMessage = FirebaseFirestore.instance;
TextEditingController post = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              width: 300,
              height: 80,
              child: TextField(
                controller: post,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                        onPressed: () async {
                          if (post.text.isNotEmpty) {
                            final postDoc = storeMessage.collection("post").doc();
                            await postDoc.set({
                              "post": post.text.trim(),
                              "time": DateTime.now(),
                              "nickname": nickname,
                            });
                            await postDoc.update({
                              "id": postDoc.id,
                            });
                            post.clear();
                          }
                        },
                        icon: Icon(Icons.send, color: Colors.black)),
                  hintText: 'Qual é a boa?',
                  hintStyle: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  )
                ),
                
              ),
              
            ),
          ],
        ),
        SingleChildScrollView(
              physics: ScrollPhysics(),
              reverse: true,
              child: ShowMessages(),
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