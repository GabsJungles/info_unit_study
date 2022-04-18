import 'package:flutter/material.dart';
import 'package:info_unity_study/widgets/criar_post/criar_post.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';

import '../../widgets/criar_post/criar_post_disciplinas.dart';

class DisciplinasPage extends StatefulWidget {
  const DisciplinasPage({ Key? key }) : super(key: key);

  @override
  State<DisciplinasPage> createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<DisciplinasPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'DISCIPLINAS'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CriarPostDisciplinas(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}