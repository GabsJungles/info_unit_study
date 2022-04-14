import 'package:flutter/material.dart';

class CustomButtonFavorite extends StatelessWidget {
  final Widget criarPost;
  final Function() onPressed;
  const CustomButtonFavorite({
    Key? key,
    required this.criarPost,
    required this.onPressed,
  }) : super(key: key);

//BOTÕES REGISTRE-SE E PRÓXIMO

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Image(image: AssetImage('lib/images/FAVORITOS.png')),
        iconSize: 40,
        onPressed: () {
          Navigator.pop(context);
        });
        
    
    
  }
}
