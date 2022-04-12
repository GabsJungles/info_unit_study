import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

class FormatDate extends StatefulWidget {
  final DateTime time;
  const FormatDate({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<FormatDate> createState() => _FormatDateState();
}

class _FormatDateState extends State<FormatDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
          color: Color(0xFF8F00FF), borderRadius: BorderRadius.circular(15.0)),
      child: Center(
          child: Text(
        DateFormat("dd-MM | KK:mm").format(DateTime.now()),
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
