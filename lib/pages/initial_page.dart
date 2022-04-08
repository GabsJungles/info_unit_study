import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/login_page.dart';
import 'package:info_unity_study/pages/register%20pages/register_page1.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
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
              height: 200,
              width: 510,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('lib/images/image3.png')),
              ),
            ),

//TEXTO ABAIXO DA FOTO DA TELA INICIAL

            Container(
              child: Text("INFO UNITY STUDY",
                  style: Theme.of(context).textTheme.headline1),
            ),

            const SizedBox(
              height: 70,
            ),

//BOTÃO DE REGISTRE-SE

            CustomButtons1(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => RegisterPage1())));
              },
              text: "REGISTRE-SE",
            ),

            const SizedBox(
              height: 40,
            ),

//BOTÃO DE LOGIN

            CustomButtons2(
              onPressed: () {
                              Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              },
            )
          ]),
    );
  }
}
