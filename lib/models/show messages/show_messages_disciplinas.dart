import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_model.dart';
import 'package:info_unity_study/models/format_time.dart';
import 'package:info_unity_study/pages/home_page.dart';
import 'package:info_unity_study/pages/post_details.dart';
import 'package:info_unity_study/widgets/tags_widget.dart';

class ShowMessagesDisciplinas extends StatefulWidget {
  final String? tagText;
  const ShowMessagesDisciplinas({
    Key? key,
    this.tagText,
  }) : super(key: key);

  @override
  State<ShowMessagesDisciplinas> createState() => _ShowMessagesDisciplinasState();
}

class _ShowMessagesDisciplinasState extends State<ShowMessagesDisciplinas> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("postDisciplinas")
          .orderBy("time")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.docs.reversed.length,
            shrinkWrap: true,
            primary: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, i) {
              QueryDocumentSnapshot document = snapshot.data!.docs[i];
              return ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 156, 155, 155),
                            blurRadius: 10.0)
                      ]),
                      width: 350,
                      height: 180,
                        child: InkWell(
                           onTap: (() {
                          final id = document["id"];
                          final nickname = document["nickname"];
                          final post = document["post"];
                          Timestamp time = document["time"];
                          final tag = document["tag"];
                          final timeAsDate = time.toDate();
                          final postModel = PostModel(
                              id: id,
                              nickname: nickname,
                              post: post,
                              time: timeAsDate,
                              tag: tag,
                              );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      PostDetails(post: postModel))));
                        }),
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Card(
                              margin: const EdgeInsets.all(10.0),
                              elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(document['nickname'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                      FormatDate(
                                          time: (document['time'] as Timestamp)
                                              .toDate())
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(document['post'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: Colors.black)),
                                  SizedBox(height: 10),
                                  TagsWidget(postId: document["id"]),
                                ],
                              ),
                            ),
                          ),
                        ),
                    )
                  ]));
            });
      },
    );
  }
}
