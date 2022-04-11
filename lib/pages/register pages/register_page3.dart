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
  String? selectedCourse = '';
  String? selectedSemester = '';
  final List<String> cursos = [
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
  ];
  String? value = 'Administração';

  final List<String> periodo = [
    '1° período',
    '2° período',
    '3° período',
    '4° período',
    '5° período',
    '6° período',
    '7° período',
    '8° período',
    '9° período',
    '10° período',
    '11° período',
    '12° período',
  ];
  String? value2 = '1° período';

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
            height: 100,
          ),

          Row(
            children: [
              SizedBox(width: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('CURSO', style: Theme.of(context).textTheme.headline3),
              ),
            ],
          ),
          SizedBox(height: 10),
//CAMPO DE ESCOLHA DO CURSO

          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))),
            child: DropdownButton<String>(
              selectedItemBuilder: (_) {
                return cursos
                    .map((e) => Container(
                          alignment: Alignment.center,
                          child: Text(
                            e,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ))
                    .toList();
              },
              value: value,
              icon: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_drop_down, color: Color(0xFF8F00FF)),
              ),
              items: cursos.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black54),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  value = _;
                });
                if (value != null) {
                  selectedCourse = value;
                }
              },
            ),
          ),

          // DecoratedBox(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.white,

          //   ),
          //   child: DropdownButton<String>(
          //     items: <String>[
          //       'Administração',
          //       'Arquitetura e Urbanismo',
          //       'Análise e Desenvolvimento de Sistemas',
          //       'Biomedicina',
          //       'Ciência da Computação',
          //       'Ciências Contábeis',
          //       'Cinema e Audiovisual',
          //       'Comércio Exterior',
          //       'Criminologia',
          //       'Design',
          //       "Design de Animação",
          //       'Design de Interiores',
          //       'Design Gráfico',
          //       'Direito',
          //       'Engenharia Civil',
          //       'Engenharia da Computação',
          //       'Engenharia de Controle e Automação',
          //       'Engenharia de Produção',
          //       'Engenharia Elétrica',
          //       'Engenharia Mecânica',
          //       'Engenharia Química',
          //       'Fabricação Mecânica',
          //       'Farmácia',
          //       'Fisioterapia',
          //       'Gestão da Tecnologia da Informação',
          //       'Jogos Digitais',
          //       'Jornalismo',
          //       'Marketing',
          //       'Mecatrônica Industrial',
          //       'Medicina Veterinária',
          //       'Nutrição',
          //       'Odontologia',
          //       'Pedagogia',
          //       'Produção Audiovisual',
          //       'Psicologia',
          //       'Publucidade e Propaganda',
          //       'Relações Internacionais',
          //       'Relações Públicas',
          //       'Sistemas de Informação',
          //     ].map((String value) {
          //       return DropdownMenuItem<String>(value: value, child: Text(value));
          //     }).toList(),
          //     onChanged: (value) {
          //       if (value != null) {
          //         selectedCourse = value;
          //       }
          //     },
          //   ),
          // ),

          SizedBox(height: 30),

          Row(
            children: [
              SizedBox(width: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('PERÍODO', style: Theme.of(context).textTheme.headline3),
              ),
            ],
          ),
          SizedBox(height: 10),
//CAMPO DE ESCOLHA DO PERÍODO

          Container(

            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: DropdownButton<String>(
              selectedItemBuilder: (_) {
                return periodo
                    .map((e) => Container(
                          alignment: Alignment.center,
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                    .toList();
              },
              value: value2,
              icon: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_drop_down, color: Color(0xFF8F00FF)),
              ),
              items: periodo.map((String value2) {
                return DropdownMenuItem<String>(
                  value: value2,
                  child: Text(
                    value2,
                    style: const TextStyle(color: Colors.black54),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  value2 = _;
                });
                if (value != null) {
                  selectedSemester = value2;
                }
              },
            ),
          ),

          // DecoratedBox(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.white,
          //   ),
          //   child: DropdownButton<String>(
          //     items: <String>[
          //       "1",
          //       "2",
          //       "3",
          //       "4",
          //       "5",
          //       "6",
          //       "7",
          //       "8",
          //       "9",
          //       "10",
          //       "11",
          //       "12"
          //     ].map((String value) {
          //       return DropdownMenuItem<String>(value: value, child: Text(value));
          //     }).toList(),
          //     onChanged: (value) {
          //       if (value != null) {
          //         selectedSemester = value;
          //       }
          //     },
          //   ),
          // ),

          SizedBox(height: 100),

//BOTÃO DE LOGIN

          CustomButtons1(
            text: "PRÓXIMO",
            onPressed: () async {
              await signUp();
              await saveCredentials(widget.email, widget.password, widget.name,
                  widget.nickname, selectedCourse!, selectedSemester!);
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
          )
        ]));
  }

  Future<void> saveCredentials(String email, String password, String name,
      String nickname, String course, String semester) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser?.uid != null) {
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
        email: widget.email, password: widget.password);
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
  }
}
