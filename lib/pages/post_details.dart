import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_model.dart';
import 'package:info_unity_study/widgets/comment_field.dart';
import 'package:info_unity_study/widgets/custom_buttonback.dart';
import 'package:info_unity_study/widgets/tags_widgets/tags_widget.dart';

import '../models/format_time.dart';

class PostDetails extends StatefulWidget {
  final PostModel post;
  const PostDetails({Key? key, required this.post}) : super(key: key);

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
                    ButtonBack(),
                    SizedBox(height: 50),
                  ],
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    title: Card(
                      margin: const EdgeInsets.all(10.0),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.post.nickname!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                                      
                              FormatDate(time: widget.post.time!)
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(widget.post.post!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black)),
                                  const SizedBox(height: 10),
                                TagsWidget(postId: widget.post.id),
                        ],
                      ),
                    ),
                    // children: const <Widget>[ListTile(title: Text('a'))],
                    children: [
                      CommentField(
                        post: widget.post,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
