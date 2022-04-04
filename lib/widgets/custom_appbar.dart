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
      flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.red,
              Colors.blue
            ])          
         ),        
     ),      
      elevation: 0,
      centerTitle: true, //leading, title, actions
      actions: hasActions
          ? [
              IconButton(
                  icon: Icon(Icons.message,
                      color: Colors.white),
                  onPressed: () {
                  }),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}