import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TagsWidgetAvaliacoes extends StatefulWidget {
  final String postId;
  const TagsWidgetAvaliacoes({
    Key? key, required this.postId,
  }) : super(key: key);

  @override
  State<TagsWidgetAvaliacoes> createState() => _TagsWidgetAvaliacoesState();
}

class _TagsWidgetAvaliacoesState extends State<TagsWidgetAvaliacoes> {
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
        FirebaseFirestore.instance.collection("postAvaliacoes").doc(widget.postId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        tagText = data['tag'];
      });
    });
  }
}
