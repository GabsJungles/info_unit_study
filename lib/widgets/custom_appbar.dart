import 'package:flutter/material.dart';
import 'package:info_unity_study/config/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 170,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color(0xFF8F00FF),
              Color.fromARGB(255, 70, 69, 69),
            ])          
         ),        
     ),      
      elevation: 0,
      centerTitle: true, 
     actions: [
            Builder(
              builder: ((context) {
                return IconButton(
                    icon: const Icon(Icons.align_horizontal_right),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  );
              }),
            )
          ],
          title: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/logo.final.gif'),
                    fit: BoxFit.contain),
                    shape: BoxShape.circle),
                  ),
                  const SizedBox(height: 20),
              Text('INFO UNITY STUDY', style: Theme.of(context).textTheme.headline4),
            ],
          ),
      // actions: hasActions
      //     ? [
      //         IconButton(
      //             icon: Icon(Icons.message,
      //                 color: Colors.white),
      //             onPressed: () {
      //             }),
      //       ]
      //     : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(170.0);
}