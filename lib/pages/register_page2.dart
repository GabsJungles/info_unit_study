import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/register_page3.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(),
            Container(
              height: 130,
              width: 510,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/logo.final.gif'),
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
//TEXTO ABAIXO DA LOGO DA TELA

            Container(
              child: Text("INFO UNITY STUDY",
                  style: Theme.of(context).textTheme.headline1),
            ),

            const SizedBox(
              height: 30,
            ),

//CAMPO DE PREENCHIMENTO DE EMAIL

            Container(
              alignment: Alignment.bottomLeft,
              child: Text('NOME', style: Theme.of(context).textTheme.headline3),
            ),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Digite seu Nome Completo'))),

//CAMPO DE PREENCHIMENTO DE SENHA

            Container(
              alignment: Alignment.bottomLeft,
              child:
                  Text('APELIDO', style: Theme.of(context).textTheme.headline3),
            ),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Digite Seu Apelido'))),

//BOTÃO DE LOGIN

            CustomButtons1(
              text: "PRÓXIMO",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => RegisterPage3())));
              },
            )
          ]),
    );
  }
}