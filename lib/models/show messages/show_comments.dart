import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/format_time.dart';
import 'package:info_unity_study/models/format_time2.dart';

class ShowComments extends StatefulWidget {
final String postId;
  ShowComments({ Key? key,
  required this.postId
   }) : super(key: key);

  @override
  State<ShowComments> createState() => _ShowCommentsState();
}

class _ShowCommentsState extends State<ShowComments> {
  @override
  Widget build(BuildContext context) {
      return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
      .collection('post')
      .doc(widget.postId)
          .collection("comments")
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
              return Column(
                children: [
                  ListTile(
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                        Card(
                          elevation: 2,
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
                                            .headline3!
                                            .copyWith(color: Colors.black)),
                                    FormateDate2(
                                        time: (document['time'] as Timestamp)
                                            .toDate()),

                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(document['comment'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.black)),
                              ],
                            ),
                          ),
                        )
                      ])),
                ],
              );
            });
      },
    );

    }
  }
  

