import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedCourse = '';
  String selectedSemester = '';
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
   
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            Color(0xFF8F00FF),
            Colors.black,
            Colors.black,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [imageProfile()],
              ),
              SizedBox(height: 10),
              Text("${data['name']}", style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 20),
              Text("${data['email']}", style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 20),
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
            style: Theme.of(context).textTheme.headline5
          ),
        ),
        SizedBox(height: 20),   
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
            style: Theme.of(context).textTheme.headline5,
          ),
        ),

            ],
            
          )));
}
        return Text("loading");
        }
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Text('Escolha sua imagem de perfil',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black)),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Câmera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Galeria"),
            )
          ])
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: <Widget>[
        _imageFile == null
            ? const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("lib/images/person-icon.png"))
            : CircleAvatar(
                radius: 80.0,
                backgroundImage: FileImage(File(_imageFile!.path))),
        Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet(context)));
              },
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 28.0,
              ),
            )),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
