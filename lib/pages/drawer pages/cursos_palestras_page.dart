import 'package:flutter/material.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';
import '../../widgets/criar_post/criar_post_palestras.dart';

class CursosPalestrasPage extends StatefulWidget {
  const CursosPalestrasPage({ Key? key }) : super(key: key);

  @override
  State<CursosPalestrasPage> createState() => _CursosPalestrasPageState();
}

class _CursosPalestrasPageState extends State<CursosPalestrasPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'CURSOS/PALESTRAS'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CriarPostPalestras(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}