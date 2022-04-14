import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

class FormateDate2 extends StatefulWidget {
  final DateTime time;
  const FormateDate2({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<FormateDate2> createState() => _FormatDate2State();
}

class _FormatDate2State extends State<FormateDate2> {
  @override
  Widget build(BuildContext context) {
    if (widget.time != null) {
      return Container(
        height: 20,
        width: 80,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 166, 0, 255), Color(0xffFF45EC), Color(0xffFF45EC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
            child: Text(
          DateFormat("dd-MM | KK:mm").format(widget.time),
          style: Theme.of(context).textTheme.headline5,
        )),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
