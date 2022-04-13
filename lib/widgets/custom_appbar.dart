import 'package:flutter/material.dart';
import 'package:info_unity_study/config/theme.dart';
import 'package:info_unity_study/widgets/custom_buttonback.dart';
import 'package:info_unity_study/widgets/search_bar.dart';

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
    if(title == 'INFO UNITY STUDY'){
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
                  const SizedBox(height: 0),
              Text(title, style: Theme.of(context).textTheme.headline3),
              SearchBar(),
            ],
          ),
    );
    } else{
      return AppBar(
      toolbarHeight: 170,
      elevation: 0,
      centerTitle: true, 
      backgroundColor: Colors.black,
      leading: ButtonBack(),
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
                  const SizedBox(height: 0),
  
              Text(title, style: Theme.of(context).textTheme.headline3),
              SearchBar(),
            ],
          ),
    );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(170.0);
}
