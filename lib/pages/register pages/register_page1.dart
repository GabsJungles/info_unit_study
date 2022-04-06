import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/register%20pages/register_page2.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              child:
                  Text('E-MAIL', style: Theme.of(context).textTheme.headline3),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Digite seu E-mail'))),

//CAMPO DE PREENCHIMENTO DE SENHA

            Container(
              alignment: Alignment.bottomLeft,
              child:
                  Text('SENHA', style: Theme.of(context).textTheme.headline3),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Senha'))),

            Container(
              alignment: Alignment.bottomLeft,
              child: Text('REPITA SUA SENHA',
                  style: Theme.of(context).textTheme.headline3),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Senha'))),

//BOTÃO DE LOGIN

            CustomButtons1(
              text: "PRÓXIMO",
              onPressed: signUp,
            )
          ]),
    );
    
  }
   Future signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim());
      Navigator.push(context, 
      MaterialPageRoute(builder: ((context) => RegisterPage2())));
  }
}
