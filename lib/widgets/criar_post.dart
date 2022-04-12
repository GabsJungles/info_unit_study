import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/models/card_post_model.dart';

class CriarPost extends StatefulWidget {


  const CriarPost({ Key? key}) : super(key: key);

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
final storeMessage = FirebaseFirestore.instance;
TextEditingController post = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              width: 300,
              height: 80,
              child: TextField(
                controller: post,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                        onPressed: () {
                          if (post.text.isNotEmpty) {
                            storeMessage.collection("post").doc().set({
                              "post": post.text.trim(),
                              "time": DateTime.now()
                            });
                            post.clear();
                          }
                        },
                        icon: Icon(Icons.send, color: Colors.black)),
                  hintText: 'Qual é a boa?',
                  hintStyle: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  )
                ),
                
              ),
              
            ),
          ],
        ),
        SingleChildScrollView(
              physics: ScrollPhysics(),
              reverse: true,
              child: ShowMessages(),
            ),
      ],
    );
  }
}

// class ShowMessages extends StatelessWidget {
// String? text;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection("post")
//           .orderBy("time")
//           .snapshots(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             shrinkWrap: true,
//             primary: true,
//             physics: ScrollPhysics(),
//             itemBuilder: (context, i) {
//               QueryDocumentSnapshot x = snapshot.data!.docs[i];
//               return ListTile(
//                   title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                    Text(x['post'],
//                           style: TextStyle(color: Colors.black))
//                 ],
//               ));
//             });
//       },
//     );
//   }
// }