import 'package:flutter/material.dart';

class DrawerWicom extends StatefulWidget {
  @override
  _DrawerWicom createState() => _DrawerWicom();
}

class _DrawerWicom extends State<DrawerWicom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: 220,
          child: Drawer(
              child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          //height: 200,
                          color: Colors.grey.withAlpha(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "fonts/facebookIco.png",
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("correo@prueba.me")
                            ],
                          )),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Profile");
                        },
                        leading: Icon(Icons.person),
                        title: Text(
                          "Mi perfil",
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped publica");
                        },
                        leading: Icon(Icons.folder_shared),
                        title: Text("Mis Publicaciones"),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped votaciones");
                        },
                        leading: Icon(Icons.rule_folder),
                        title: Text("Mis votaciones"),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Notifications");
                        },
                        leading: Icon(Icons.notifications),
                        title: Text("Notificaciones"),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped confi");
                        },
                        leading: Icon(Icons.settings),
                        title: Text("Configuración"),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Log Out");
                        },
                        leading: Icon(Icons.exit_to_app),
                        title: Text("Log Out"),
                      )
                    ],
                  ))))),
    );
  }
}
