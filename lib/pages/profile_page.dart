import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ProfilePage extends StatefulWidget {

  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
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
                    onPressed: () => _upload('camera'),
                    icon: const Icon(Icons.camera),
                    label: const Text('camera')),
            TextButton.icon(
                    onPressed: () => _upload('gallery'),
                    icon: const Icon(Icons.library_add),
                    label: const Text('Gallery')),
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ElevatedButton.icon(
                //     onPressed: () => _upload('camera'),
                //     icon: const Icon(Icons.camera),
                //     label: const Text('camera')),
                // ElevatedButton.icon(
                //     onPressed: () => _upload('gallery'),
                //     icon: const Icon(Icons.library_add),
                //     label: const Text('Gallery')),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => _delete(image['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  else {
    return CircularProgressIndicator();
  } 





//   String selectedCourse = '';
//   String selectedSemester = '';

//   XFile? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     var currentUser = FirebaseAuth.instance.currentUser;

//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(currentUser!.uid).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return const Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: <Color>[
//             Color(0xFF8F00FF),
//             Colors.black,
//             Colors.black,
//           ])),
//       child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Column(
//             children: [
//               const SizedBox(
//                 height: 100,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [imageProfile()],
//               ),
//               const SizedBox(height: 10),
//               Text("${data['name']}", style: Theme.of(context).textTheme.headline1),
//               const SizedBox(height: 20),
//               Text("${data['email']}", style: Theme.of(context).textTheme.headline2),
//               const SizedBox(height: 20),
//               DecoratedBox(
//           decoration: const BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.white,
//           ),
//           child: DropdownButton<String>(
//             items: <String>[
//               'Administração',
//               'Arquitetura e Urbanismo',
//               'Análise e Desenvolvimento de Sistemas',
//               'Biomedicina',
//               'Ciência da Computação',
//               'Ciências Contábeis',
//               'Cinema e Audiovisual',
//               'Comércio Exterior',
//               'Criminologia',
//               'Design',
//               "Design de Animação",
//               'Design de Interiores',
//               'Design Gráfico',
//               'Direito',
//               'Engenharia Civil',
//               'Engenharia da Computação',
//               'Engenharia de Controle e Automação',
//               'Engenharia de Produção',
//               'Engenharia Elétrica',
//               'Engenharia Mecânica',
//               'Engenharia Química',
//               'Fabricação Mecânica',
//               'Farmácia',
//               'Fisioterapia',
//               'Gestão da Tecnologia da Informação',
//               'Jogos Digitais',
//               'Jornalismo',
//               'Marketing',
//               'Mecatrônica Industrial',
//               'Medicina Veterinária',
//               'Nutrição',
//               'Odontologia',
//               'Pedagogia',
//               'Produção Audiovisual',
//               'Psicologia',
//               'Publucidade e Propaganda',
//               'Relações Internacionais',
//               'Relações Públicas',
//               'Sistemas de Informação',
//             ].map((String value) {
//               return DropdownMenuItem<String>(value: value, child: Text(value));
//             }).toList(),
//             onChanged: (value) {
//               if (value != null) {
//                 selectedCourse = value;
//               }
//             },
//             style: Theme.of(context).textTheme.headline5
//           ),
//         ),
//         const SizedBox(height: 20),   
// //CAMPO DE ESCOLHA DO PERÍODO

//         DecoratedBox(
//           decoration: const BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.white,
//           ),
//           child: DropdownButton<String>(
//             items: <String>[
//               "1",
//               "2",
//               "3",
//               "4",
//               "5",
//               "6",
//               "7",
//               "8",
//               "9",
//               "10",
//               "11",
//               "12"
//             ].map((String value) {
//               return DropdownMenuItem<String>(value: value, child: Text(value));
//             }).toList(),
//             onChanged: (value) {
//               if (value != null) {
//                 selectedSemester = value;
//               }
//             },
//             style: Theme.of(context).textTheme.headline5,
//           ),
//         ),

//             ],

//           )));
// }
//         return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//     );
//   }

//   Widget bottomSheet(BuildContext context) {
//     return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//       child: Column(
//         children: <Widget>[
//           Text('Escolha sua imagem de perfil',
//               style: Theme.of(context)
//                   .textTheme
//                   .headline4!
//                   .copyWith(color: Colors.black)),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             TextButton.icon(
//               icon: const Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: const Text("Câmera"),
//             ),
//             TextButton.icon(
//               icon: const Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: const Text("Galeria"),
//             )
//           ])
//         ],
//       ),
//     );
//   }

//   Widget imageProfile() {
//     FirebaseStorage _storage = FirebaseStorage.instance;
//     return Stack(
//       children: <Widget>[
//         _imageFile == null
//             ? const CircleAvatar(
//                 radius: 80.0,
//                 backgroundImage: AssetImage("lib/images/person-icon.png"))
//             : CircleAvatar(
//                 radius: 80.0,
//                 backgroundImage: FileImage(File(_imageFile!.path))),

//         Positioned(
//             bottom: 20.0,
//             right: 20.0,
//             child: InkWell(
//               onTap: () {
//                 showModalBottomSheet(
//                     context: context,
//                     builder: ((builder) => bottomSheet(context)));
//               },
//               child: const Icon(
//                 Icons.camera_alt_outlined,
//                 color: Colors.black,
//                 size: 28.0,
//               ),
//             )),
//       ],
//     );
//   }

//   void takePhoto(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }

}
    );
  }
}