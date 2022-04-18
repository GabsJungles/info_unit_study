import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _isVisible = false;
  bool _isVisible2 = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const SizedBox(height: 50),
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
            child: Text('E-MAIL', style: Theme.of(context).textTheme.headline3),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Digite seu E-mail',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF8F00FF)),
                      )))),

//CAMPO DE PREENCHIMENTO DE SENHA

          Container(
            alignment: Alignment.bottomLeft,
            child: Text('SENHA', style: Theme.of(context).textTheme.headline3),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              child: TextField(
                  controller: passwordController,
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(Icons.visibility, color: Color(0xFF8F00FF))
                            : Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Senha',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF8F00FF)),
                      )))),

          Container(
            alignment: Alignment.bottomLeft,
            child: Text('CONFIRME SUA SENHA',
                style: Theme.of(context).textTheme.headline3),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              child: TextField(
                  controller: passwordConfirmController,
                  obscureText: !_isVisible2,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible2 = !_isVisible2;
                          });
                        },
                        icon: _isVisible2
                            ? Icon(Icons.visibility, color: Color(0xFF8F00FF))
                            : Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Confirme sua senha',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF8F00FF)),
                      )))),

//BOTÃO DE LOGIN

          CustomButtons1(
            text: "PRÓXIMO",
            onPressed: () {
              if (passwordController.text != passwordConfirmController.text) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: <Color>[
                                Color(0xFF8F00FF),
                                Colors.black,
                              ])),
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 5.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "As senhas não correspondem",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: GoogleFonts.merriweather()
                                              .fontFamily,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: GoogleFonts.nunito()
                                                  .fontFamily,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => RegisterPage2(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          )),
                    ));
              }
            },
          )
        ]),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => RegisterPage2(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ))));
  }
}
