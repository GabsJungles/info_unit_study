import 'package:flutter/material.dart';
import 'package:info_unity_study/widgets/criar_post/criar_post.dart';
import 'package:info_unity_study/widgets/criar_post/criar_post_calendar.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({ Key? key, }) : super(key: key);

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'CALENDÁRIO'),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CriarPostCalendar(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}