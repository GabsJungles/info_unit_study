import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_model.dart';
import 'package:info_unity_study/models/card_post_model.dart';
import 'package:info_unity_study/widgets/custom_buttonback.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color(0xFF8F00FF),
              Color(0xFF8F00FF),
              Colors.black,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            reverse: true,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: const [
                    const ButtonBack(),
                    const SizedBox(height: 50),
                  ],
                ),
                ShowMessages(),
              ],
            ),
          ),
        ));
  }
}
