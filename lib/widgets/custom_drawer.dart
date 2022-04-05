import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  get align => null;

  get text => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0),
      child: Scaffold(
          key: scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          backgroundColor: Colors.red,
          endDrawer: Drawer(
             child: Column(
               children: const [
                DrawerHeader(
                   child: CircleAvatar(),
                 ),
                 ListTile(
                   title: Text('teste'),
                 )
               ],
             )
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
