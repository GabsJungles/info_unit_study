import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class CardPost extends StatefulWidget {
//   final String text;


//   const CardPost({ Key? key,
//   required this.text,
//    }) : super(key: key);

//   @override
//   State<CardPost> createState() => _CardPostState();
// }

// class _CardPostState extends State<CardPost> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color.fromARGB(255, 156, 155, 155),
//                         blurRadius: 10.0
//                       )
//                     ]
//                   ),
//                   width: 350,
//                   height: 150,
//                   child: Card(
//                     color: Colors.white,
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16)),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.text,
//                                   style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black)
//                                 ),
//                               ],
//                             ),
                          
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//   }
// }

class ShowMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("post")
          .orderBy("time")
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            primary: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, i) {
              QueryDocumentSnapshot x = snapshot.data!.docs[i];
              return ListTile(
                  title: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Center(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 156, 155, 155),
                        blurRadius: 10.0
                      )
                    ]
                  ),
                  width: 350,
                  height: 150,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  x['post'],
                                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black)
                                ),
                              ],
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              )
                ]
              ));
            });
      },
    );
  }
}


