import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  get align => null;

  get text => null;

  get padding => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color(0xFF420074),
              Color(0xFF420074),
              Color(0xFF8C097F),
            ])          
         ), 
        child: Scaffold(
            key: scaffoldKey,
            endDrawerEnableOpenDragGesture: false,
            backgroundColor: Colors.transparent,
            endDrawer: Drawer(
               child: ListView(
                 shrinkWrap: true,
                 children: [
                   DrawerHeader(
                     decoration: const BoxDecoration(
                       color: Colors.white,
                     ),
                     child: Container(
                       height: 50,
                       width: 50,
                       color: Colors.pink,
                       child: Column(
                         children: [
                           Text("Isabella McGinley",
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                                 fontFamily: GoogleFonts.signika().fontFamily
                               )),
                           Text("Aspiring Flutter Programmer",
                               style: TextStyle(
                                 color: const Color(0xFF704E2E),
                                 fontSize: 13,
                                 fontFamily: GoogleFonts.hind().fontFamily
                               ) 
                             ),
                         ],
                       ),
                     )
                   ),
                   ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: Text('isabellabitt1@hotmail.com',
                      style: TextStyle(
                        fontFamily: GoogleFonts.ubuntu().fontFamily
                      ),
                    ),
                   ),
                 ],
               ),
              ),
            ),
      ),
      );
        }
}
      // actions: hasActions
      //     ? [
      //         IconButton(
      //             icon: Icon(Icons.message,
      //                 color: Colors.white),
      //             onPressed: () {
      //             }),
      //       ]
      //     : null
