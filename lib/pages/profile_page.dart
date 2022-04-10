import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_unity_study/widgets/image_controller.dart';
import 'package:path/path.dart' as path;

class ProfilePage extends StatefulWidget {
  final String? selectedCourse;
  final String? selectedSemester;
  const ProfilePage({
    Key? key,
    this.selectedCourse,
    this.selectedSemester
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = ImageController();
  FirebaseStorage storage = FirebaseStorage.instance;

  File? _imageFile;

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
  
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    String? selectedCourse = '';
    String? selectedSemester = '';

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
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
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [imageProfile()],
                        ),
                        const SizedBox(height: 10),
                        Text("${data['name']}",
                            style: Theme.of(context).textTheme.headline1),
                        const SizedBox(height: 20),
                        Text("${data['email']}",
                            style: Theme.of(context).textTheme.headline2),
                        const SizedBox(height: 20),

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
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ))
                                  .toList();
                            },
                            value: value,
                            icon: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.arrow_drop_down,
                                  color: Color(0xFF8F00FF)),
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

                        const SizedBox(height: 20),
//CAMPO DE ESCOLHA DO PERÍODO

                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
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
              icon: const Icon(Icons.camera, color: Color(0xFF8F00FF)),
              onPressed: () async {
                final pickedFile =
                    await _controller.pickImage(ImageSource.camera);
                await _controller.uploadImage(_imageFile!);
                setState(() {
                  _imageFile = pickedFile;
                });
              },
              label: Text("Câmera",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black)),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image, color: Color(0xFF8F00FF)),
              onPressed: () async {
                final pickedFile =
                    await _controller.pickImage(ImageSource.gallery);
                await _controller.uploadImage(_imageFile!);

                setState(() {
                  _imageFile = pickedFile;
                });
              },
              label: Text("Galeria",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black)),
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
  Future<void> updateCredentials(String course, String semester) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser?.uid != null) {
      await firestore.collection("users").doc(currentUser!.uid).update({
        "course": course,
        "semester": semester,
      });
    }
  }
}
