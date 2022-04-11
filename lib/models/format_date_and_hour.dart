import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDate extends StatefulWidget {
  const FormatDate({Key? key}) : super(key: key);

  @override
  State<FormatDate> createState() => _FormatDateState();
}

class _FormatDateState extends State<FormatDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        DateFormat('dd-MM-yyyy KK:mm').format(DateTime.now()),
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}


