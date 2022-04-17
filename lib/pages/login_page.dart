import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/home_page.dart';
import 'package:info_unity_study/pages/profile_page.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
      final emailController = TextEditingController();
      final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                height: 130,
                width: 510,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image:
                      DecorationImage(
                        image: AssetImage('lib/images/logo.final.gif'),
                      fit: BoxFit.contain,
                      ),
                      shape: BoxShape.circle,
                ),
              ),

const SizedBox(
  height: 20,


),
//TEXTO ABAIXO DA FOTO DA TELA INICIAL

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
  child: Text('E-MAIL',
  style: Theme.of(context).textTheme.headline3),
),

                 Padding(
                      padding:
                           EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                      child: TextField(
                        controller: emailController,
                          decoration:  InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Digite seu E-mail'
                          ))),

//CAMPO DE PREENCHIMENTO DE SENHA

Container(
  alignment: Alignment.bottomLeft,
  child: Text('SENHA',
  style: Theme.of(context).textTheme.headline3),
),

                 Padding(
                      padding:
                           EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                      child: TextField(
                        controller: passwordController,
                          decoration:  InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Digite sua Senha'
                          ))),


const SizedBox(
  height: 20,
),

//BOTÃO DE LOGIN

              CustomButtons2(
                text: 'LOGIN',
                onPressed: signIn,
              )
            ]),
      ),
    );
  }
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim());
      Navigator.push(context, 
      MaterialPageRoute(builder: ((context) => HomePage())));
  }
}
