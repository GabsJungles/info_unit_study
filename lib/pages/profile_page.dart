import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_unity_study/pages/login_page.dart';
import 'package:info_unity_study/widgets/custom_buttonback.dart';
import 'package:info_unity_study/widgets/custom_buttons2.dart';
import 'package:info_unity_study/controllers/image_controller.dart';

import '../models/card_model.dart';

class ProfilePage extends StatefulWidget {
  final String? selectedCourse;
  final String? selectedSemester;
  final PostModel? post;
  String? tagText;
  ProfilePage(
      {Key? key, this.selectedCourse, this.selectedSemester, this.tagText, this.post})
      : super(key: key);

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
  String? value2;
  String? value;
  String? tagText;
  @override
  void initState() {
    super.initState();
    getCourse();
    getSemester();
    getTag();
  }

  dynamic data;

  Future<void> getCourse() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        value = data['course'];
      });
    });
  }

  Future<void> getSemester() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        value2 = data['semester'];
      });
    });
  }

  Future<void> getTag() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        tagText = data['tag'];
      });
    });
  }

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
                        SizedBox(height: 40),
                        Row(
                          children: [ButtonBack()],
                        ),
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
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
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
                              backgroundColor: Colors.white,
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
                            onChanged: (_) async {
                              setState(() {
                                value = _;
                              });
                              if (value != null) {
                                selectedCourse = value;
                              }

                              updateCourse(selectedCourse!);
                              switch (selectedCourse) {
                                case 'Administração':
                                  tagText = "ADM";
                                  await updateTag(tagText!);
                                  break;
                                case 'Arquitetura e Urbanismo':
                                  tagText = "Arq&Urb";
                                  await updateTag(tagText!);
                                  break;
                                case 'Análise e Desenvolvimento de Sistemas':
                                  tagText = "ADS";
                                  await updateTag(tagText!);
                                  break;
                                case 'Biomedicina':
                                  tagText = "Biom";
                                  await updateTag(tagText!);
                                  break;
                                case 'Ciência da Computação':
                                  tagText = "CDC";
                                  await updateTag(tagText!);
                                  break;
                                case 'Ciências Contábeis':
                                  tagText = "CC";
                                  await updateTag(tagText!);
                                  break;
                                case 'Cinema e Audiovisual':
                                  tagText = "C&Aud";
                                  await updateTag(tagText!);
                                  break;
                                case 'Comércio Exterior':
                                  tagText = "ComExt";
                                  await updateTag(tagText!);
                                  break;
                                case 'Criminologia':
                                  tagText = "Crimino";
                                  await updateTag(tagText!);
                                  break;
                                case 'Design':
                                  tagText = "Des";
                                  await updateTag(tagText!);
                                  break;
                                case 'Design de Animação':
                                  tagText = "DDA";
                                  await updateTag(tagText!);
                                  break;
                                case 'Design de Interiores':
                                  tagText = "DDI";
                                  await updateTag(tagText!);
                                  break;
                                case 'Design Gráfico':
                                  tagText = "DesG";
                                  await updateTag(tagText!);
                                  break;
                                case 'Direito':
                                  tagText = "Dir";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia Civil':
                                  tagText = "EngC";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia da Computação':
                                  tagText = "EngComp";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia de Controle e Automação':
                                  tagText = "EngCAuto";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia de Produção':
                                  tagText = "EngProd";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia Elétrica':
                                  tagText = "EngEl";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia Mecânica':
                                  tagText = "EngMec";
                                  await updateTag(tagText!);
                                  break;
                                case 'Engenharia Química':
                                  tagText = "EngQuím";
                                  await updateTag(tagText!);
                                  break;
                                case 'Fabricação Mecânica':
                                  tagText = "FabMec";
                                  await updateTag(tagText!);
                                  break;
                                case 'Farmácia':
                                  tagText = "Farm";
                                  await updateTag(tagText!);
                                  break;
                                case 'Fisioterapia':
                                  tagText = "Fisio";
                                  await updateTag(tagText!);
                                  break;
                                case 'Gestão da Tecnologia da Informação':
                                  tagText = "TecInfo";
                                  await updateTag(tagText!);
                                  break;
                                case 'Jogos Digitais':
                                  tagText = "JDig";
                                  await updateTag(tagText!);
                                  break;
                                case 'Jornalismo':
                                  tagText = "Jornal";
                                  await updateTag(tagText!);
                                  break;
                                case 'Marketing':
                                  tagText = "Mark";
                                  await updateTag(tagText!);
                                  break;
                                case 'Mecatrônica Industrial':
                                  tagText = "MecInd";
                                  await updateTag(tagText!);
                                  break;
                                case 'Medicina Veterinária':
                                  tagText = "MedVet";
                                  await updateTag(tagText!);
                                  break;
                                case 'Nutrição':
                                  tagText = "Nutri";
                                  await updateTag(tagText!);
                                  break;
                                case 'Odontologia':
                                  tagText = "Odonto";
                                  await updateTag(tagText!);
                                  break;
                                case 'Pedagogia':
                                  tagText = "Pedago";
                                  await updateTag(tagText!);
                                  break;
                                case 'Produção Audiovisual':
                                  tagText = "ProdAudio";
                                  await updateTag(tagText!);
                                  break;
                                case 'Psicologia':
                                  tagText = "Psico";
                                  await updateTag(tagText!);
                                  break;
                                case 'Publicidade e Propaganda':
                                  tagText = "Publi&Prop";
                                  await updateTag(tagText!);
                                  break;
                                case 'Relações Internacionais':
                                  tagText = "RI";
                                  await updateTag(tagText!);
                                  break;
                                case 'Relações Públicas':
                                  tagText = "RP";
                                  await updateTag(tagText!);
                                  break;
                                case 'Sistemas de Informação':
                                  tagText = "SI";
                                  await updateTag(tagText!);
                                  break;
                              }
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

//CAMPO DE ESCOLHA DO PERÍODO

                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
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
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_drop_down,
                                  color: Color(0xFF8F00FF)),
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
                            onChanged: (_) async {
                              setState(() {
                                value2 = _;
                              });
                              if (value != null) {
                                selectedSemester = value2;
                              }
                              await updateSemester(selectedSemester!);
                            },
                          ),
                        ),
                        SizedBox(height: 50),

                        CustomButtons2(
                            text: 'SAIR',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => LoginPage())));
                            })
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
                if (pickedFile != null) {
                  await _controller.uploadImage(pickedFile);
                }
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
                if (pickedFile != null) {
                  await _controller.uploadImage(pickedFile);
                }
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

  Future<void> updateCourse(String course) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser?.uid != null) {
      await firestore.collection("users").doc(currentUser!.uid).update({
        "course": course,
      });
    }
  }

  Future<void> updateTag(String tag) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser?.uid != null) {
      await firestore.collection("users").doc(currentUser!.uid).update({
        "tag": tag,
      });
    }
  }

  Future<void> updateSemester(String semester) async {
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser?.uid != null) {
      await firestore.collection("users").doc(currentUser!.uid).update({
        "semester": semester,
      });
    }
  }
}
