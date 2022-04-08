import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/home_page.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class RegisterPage3 extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String nickname;
  const RegisterPage3({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
  }) : super(key: key);

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3>
    with SingleTickerProviderStateMixin {
  String selectedCourse = '';
  String selectedSemester = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
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

//CAMPO DE ESCOLHA DO CURSO

        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: DropdownButton<String>(
            items: <String>[
              'Administração',
              'Arquitetura e Urbanismo',
              'Análise e Desenvolvimento de Sistemas',
              'Biomedicina',
              'Ciência da Computação',
              'Ciências Contábeis',
              'Cinema e Audiovisual',
              'Comércio Exterior',
              'Criminologia',
              'Design',
              "Design de Animação",
              'Design de Interiores',
              'Design Gráfico',
              'Direito',
              'Engenharia Civil',
              'Engenharia da Computação',
              'Engenharia de Controle e Automação',
              'Engenharia de Produção',
              'Engenharia Elétrica',
              'Engenharia Mecânica',
              'Engenharia Química',
              'Fabricação Mecânica',
              'Farmácia',
              'Fisioterapia',
              'Gestão da Tecnologia da Informação',
              'Jogos Digitais',
              'Jornalismo',
              'Marketing',
              'Mecatrônica Industrial',
              'Medicina Veterinária',
              'Nutrição',
              'Odontologia',
              'Pedagogia',
              'Produção Audiovisual',
              'Psicologia',
              'Publucidade e Propaganda',
              'Relações Internacionais',
              'Relações Públicas',
              'Sistemas de Informação',
            ].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                selectedCourse = value;
              }
            },
          ),
        ),

//CAMPO DE ESCOLHA DO PERÍODO

        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: DropdownButton<String>(
            items: <String>[
              "1",
              "2",
              "3",
              "4",
              "5",
              "6",
              "7",
              "8",
              "9",
              "10",
              "11",
              "12"
            ].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                selectedSemester = value;
              }
            },
          ),
        ),

//BOTÃO DE LOGIN

        CustomButtons1(
          text: "PRÓXIMO",
          onPressed: () async{
            await signUp();
            await saveCredentials(widget.email, widget.password, widget.name,
                widget.nickname, selectedCourse, selectedSemester);
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => HomePage())));
          },
        )
      ]),
    );
  }

  Future<void> saveCredentials(String email, String password, String name,
      String nickname, String course, String semester) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser?.uid != null){
    await firestore.collection("users").doc(currentUser!.uid).set({
      "name": name,
      "nickname": nickname,
      "email": email,
      "password": password,
      "course": course,
      "semester": semester,
    });
    }
  }

  Future signUp() async {
    
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => HomePage())
            )
          );
  }
}
