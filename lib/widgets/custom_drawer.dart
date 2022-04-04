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
          backgroundColor: ,
          endDrawer: Drawer(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFF420074),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: [
                            Text("Isabella McGinley", style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                      ],
                    )),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: Text('isabellabitt1@hotmail.com',
                    style: Theme.of(context).textTheme.headline4)
                  ),
              ],
            ),
          ),
      ),
    );
      // actions: hasActions
      //     ? [
      //         IconButton(
      //             icon: Icon(Icons.message,
      //                 color: Colors.white),
      //             onPressed: () {
      //             }),
      //       ]
      //     : null
  }
}