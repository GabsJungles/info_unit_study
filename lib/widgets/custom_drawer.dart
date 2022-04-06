import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_unity_study/pages/calendario_page.dart';

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
      child: Drawer(
        //GRADIENTE DRAWER
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
               child: Expanded(
                 child: SizedBox(
                   height: 100,
                   child: ListView(
                     shrinkWrap: true,
                     children: [
                       //DRAWER HEADER
                       const DrawerHeader(
                         decoration:  BoxDecoration(
                           color: Color(0xFF420074),
                         ),
                         child: 
                          CircleAvatar(),
                          ),
                      const ListTile(
                        title: Text('')
                      ),
                      //CALENDARIO
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/CALENDARIO.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('CALENDÁRIO',
                          style: Theme.of(context).textTheme.headline3
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => CalendarioPage())
                          )
                          );
                        },
                       ),
                       //DISCIPLINAS
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/DISCIPLINAS.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('DISCIPLINAS',
                          style: Theme.of(context).textTheme.headline3
                        ),
                       ),
                       //CURSOS E PALESTRAS
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/CURSOS.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('CURSOS/PALESTRAS',
                          style: Theme.of(context).textTheme.headline3
                        ),
                       ),
                       //AVALIAÇÕES
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/AVALIACOES.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('AVALIAÇÕES',
                          style: Theme.of(context).textTheme.headline3
                        ),
                       ),
                       //ESTÁGIO
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/ESTAGIO.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('ESTÁGIO',
                          style: Theme.of(context).textTheme.headline3
                        ),
                       ),
                       //FAVORITOS
                       ListTile(
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/FAVORITOS.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text('FAVORITOS',
                          style: Theme.of(context).textTheme.headline3
                        ),
                       ),
                     ],
                   ),
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
