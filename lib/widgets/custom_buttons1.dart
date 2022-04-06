import 'package:flutter/material.dart';

class CustomButtons1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtons1({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

//BOTÕES REGISTRE-SE E PRÓXIMO

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff8F00FF), Color(0xffFF45EC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {},
        child: Container(
          height: 45,
          width: 270,
          alignment: Alignment.center,
          child: Text(text,            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
