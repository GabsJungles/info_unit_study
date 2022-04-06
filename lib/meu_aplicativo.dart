import 'package:flutter/material.dart';
import 'package:info_unity_study/config/theme.dart';
import 'package:info_unity_study/pages/initial_page.dart';
import 'package:info_unity_study/pages/login_page.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        title: 'Info Unity Study',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: InitialPage(),
      );
  }
}
