import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_model.dart';
import '../../models/show messages/show_messages_calendar.dart';


class CriarPostCalendar extends StatefulWidget {
  final PostModel? post;
  const CriarPostCalendar({
    Key? key,
  this.post,
  }) : super(key: key);

  @override
  State<CriarPostCalendar> createState() => _CriarPostCalendarState();
}

class _CriarPostCalendarState extends State<CriarPostCalendar> {
  @override
  void initState() {
    super.initState();
    getNickname();
    getUserCourse();
    getTag();
  }

  String? nickname;
  final storeMessage = FirebaseFirestore.instance;
  TextEditingController post = TextEditingController();
  String? selectedCourse;
  String? tagText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20,20,20,0),
              width: 300,
              height: 80,
              child: TextField(
                controller: post,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                        onPressed: () async {
                          if (post.text.isNotEmpty) {
                            final postDoc = storeMessage.collection("postCalendar").doc();
                            await postDoc.set({
                              "post": post.text.trim(),
                              "time": DateTime.now(),
                              "nickname": nickname,
                              "id": postDoc.id,
                              "tag": tagText,
                            });
                            final postDoc2 = storeMessage.collection("post").doc();
                            await postDoc2.set({
                              "post": post.text.trim(),
                              "time": DateTime.now(),
                              "nickname": nickname,
                              "id": postDoc.id,
                              "tag": tagText,
                            });
                            post.clear();
                          }
                        },
                        
                        icon: const Icon(Icons.send, color: Colors.black)),
                  hintText: 'Qual é a boa?',
                  hintStyle: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF8F00FF)),
                  )
                ),
                
              ),
            ),
          ],
        ),
        SingleChildScrollView(
              physics: ScrollPhysics(),
              reverse: true,
              child: ShowMessagesCalendar(),
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

  Future<void> getUserCourse() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        selectedCourse = data['course'];
      });
    });
  }

  Future<void> getTag() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        tagText = data['tag'];
      });
    });
  }
}