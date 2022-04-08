import 'package:flutter/material.dart';

class CustomButtons2 extends StatelessWidget {
  final Function() onPressed;
  const CustomButtons2({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

//BOTÃO LOGIN

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffFF7759), Color(0xffFF5CEF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 45,
          width: 270,
          alignment: Alignment.center,
          child: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
