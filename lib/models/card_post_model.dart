import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';

class CardPost extends StatefulWidget {
  final String text;

  // final Timestamp time;

  const CardPost({ Key? key,
  required this.text,
  // required this.time,
   }) : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Center(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 156, 155, 155),
                        blurRadius: 10.0
                      )
                    ]
                  ),
                  width: 350,
                  height: 150,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              ],
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}

