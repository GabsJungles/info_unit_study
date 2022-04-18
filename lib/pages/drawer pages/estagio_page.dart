import 'package:flutter/material.dart';
import 'package:info_unity_study/widgets/criar_post/criar_post.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';

import '../../widgets/criar_post/criar_post_estagio.dart';

class EstagioPage extends StatefulWidget {
  const EstagioPage({ Key? key }) : super(key: key);

  @override
  State<EstagioPage> createState() => _EstagioPageState();
}

class _EstagioPageState extends State<EstagioPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'ESTÁGIO'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CriarPostEstagio(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}