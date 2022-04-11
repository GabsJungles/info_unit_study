import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/format_date_and_hour.dart';
import 'package:intl/intl.dart';

class CardPost extends StatefulWidget {
  final String postText;
  final String userName;

  const CardPost({
    Key? key,
    required this.postText,
    required this.userName,
  }) : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Color.fromARGB(255, 156, 155, 155), blurRadius: 10.0)
        ]),
        width: 350,
        height: 150,
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    Text(widget.postText,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black)),
                    Container(
                      child: FormatDate(),
                      decoration: const BoxDecoration(
                        color: Color(0xFF8F00FF),
                        
                        )
                      ),
                        
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
