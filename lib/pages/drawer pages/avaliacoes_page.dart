import 'package:flutter/material.dart';
import 'package:info_unity_study/widgets/criar_post/criar_post.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';

import '../../widgets/criar_post/criar_post_avaliacoes.dart';

class AvaliacoesPage extends StatefulWidget {
  const AvaliacoesPage({ Key? key }) : super(key: key);

  @override
  State<AvaliacoesPage> createState() => _AvaliacoesPageState();
}

class _AvaliacoesPageState extends State<AvaliacoesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'AVALIAÇÕES'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CriarPostAvaliacoes(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}