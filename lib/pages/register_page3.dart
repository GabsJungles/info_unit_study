import 'package:flutter/material.dart';
import 'package:info_unity_study/pages/home_page.dart';
import 'package:info_unity_study/widgets/custom_buttons1.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3>
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
  child:   DropdownButton<String>(items: <String>[
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
    'Sistemas de Informação',].map((String value){
      return DropdownMenuItem<String>(
        value: value,
        
        child: Text(value));
    }).toList(),
    onChanged: (_) {},
  ),
),

//CAMPO DE ESCOLHA DO PERÍODO

DecoratedBox(
   decoration: BoxDecoration(
    shape: BoxShape.rectangle,
    color: Colors.white,
  ),
  child:   DropdownButton<String>(items: <String>[
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
    ].map((String value){
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value));
    }).toList(),
    onChanged: (_) {},
  ),
),



//BOTÃO DE LOGIN

            CustomButtons1(
              text: "PRÓXIMO",
              onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
            )
          ]),
    );
  }
}
