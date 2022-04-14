import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_post_model.dart';
import 'package:info_unity_study/widgets/criar_post.dart';
import 'package:info_unity_study/widgets/custom_appbar.dart';
import 'package:info_unity_study/widgets/custom_drawer.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({ Key? key }) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'FAVORITOS'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CriarPost(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}