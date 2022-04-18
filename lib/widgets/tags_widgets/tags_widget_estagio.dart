import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_model.dart';

class TagsWidgetEstagio extends StatefulWidget {
  final String postId;
  const TagsWidgetEstagio({
    Key? key, required this.postId,
  }) : super(key: key);

  @override
  State<TagsWidgetEstagio> createState() => _TagsWidgetEstagioState();
}

class _TagsWidgetEstagioState extends State<TagsWidgetEstagio> {
  String? tagText;

  @override
  void initState() {
    super.initState();
    getTag();
  }

  @override
  Widget build(BuildContext context) {
    if (tagText != null) {
      return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 161, 46, 117), Color(0xFF8F00FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            tagText!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Future<void> getTag() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("postEstagio").doc(widget.postId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        tagText = data['tag'];
      });
    });
  }
}
