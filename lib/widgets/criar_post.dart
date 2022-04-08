import 'package:flutter/material.dart';

class CriarPost extends StatefulWidget {
  const CriarPost({Key? key}) : super(key: key);

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          width: 300,
          height: 80,
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Qual é a boa?',
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black))),
          ),
        ),
      ],
    );
  }
}
