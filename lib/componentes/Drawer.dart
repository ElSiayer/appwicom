import 'package:appwicom/pantallas/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => publicacionesScreen()),
                          //   );
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
                          signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(title: 'Log In')),
                              (route) => false);
                        },
                        leading: Icon(Icons.exit_to_app),
                        title: Text("Log Out"),
                      )
                    ],
                  ))))),
    );
  }

  Future<void> signOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    return Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }
}
