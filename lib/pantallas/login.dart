import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../componentes/Drawer.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final formKey = new GlobalKey<FormState>();
  String usu = null;
  String contra = null;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 15.0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(5.0),
        child: Scaffold(
            endDrawer: DrawerWicom(),
            appBar: AppBar(
                elevation: 20,
                title: Text(widget.title),
                centerTitle: true,
                leading: new Container(
                  child: Icon(Icons.face),
                )),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 40.0, top: 50.0),
                    child: Text(
                      'Bienvenid@!',
                      style: TextStyle(fontSize: 20),
                    )),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                  width: 300.0,
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    validator: validateEmail,
                                    controller: _emailController,
                                    keyboardType: (TextInputType.emailAddress),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Correo Electronico",
                                        fillColor: Colors.white70),
                                  )),
                              Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    validator: validarContra,
                                    controller: _passwordController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Contraseña",
                                        fillColor: Colors.white70),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 40.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  minWidth: 200.0,
                                  height: 40.0,
                                  onPressed: () {
                                    usu = null;
                                    contra = null;
                                    if (formKey.currentState.validate()) {
                                      _validEmail(_emailController.text,
                                              _passwordController.text)
                                          .then((value) {
                                        if (value == "OK") {
                                          _validPass(_emailController.text,
                                                  _passwordController.text)
                                              .then((valu) {
                                            if (valu == "OK") {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           mainScreen()),
                                              // );
                                            } else {
                                              contra = valu;
                                              formKey.currentState.validate();
                                            }
                                          });
                                        } else {
                                          usu = value;
                                          formKey.currentState.validate();
                                        }
                                      });
                                    }
                                  },
                                  color: Colors.purple,
                                  child: Text('Ingresar',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          )),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'No tienes cuenta? Registrate',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => SecondScreen()),
                                    // );
                                  })
                          ],
                        ),
                      ),
                      Text('ó Iniciar Sesión',
                          style: TextStyle(color: Colors.black)),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset('fonts/googleIco.png'),
                                iconSize: 15,
                                onPressed: () async {
                                  await _signInWithGoogle();
                                },
                              ),
                              IconButton(
                                icon: Image.asset('fonts/facebookIco.png'),
                                iconSize: 45,
                                onPressed: () {},
                              )
                            ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Política de\nprivacidad',
                                                style: linkStyle,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           Condiciones()),
                                                        // );
                                                      })
                                          ],
                                        ),
                                      )))),
                          InkWell(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Términos y\ncondiciones',
                                                style: linkStyle,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder:
                                                        //           (context) =>
                                                        //               Terminos()),
                                                        // );
                                                      })
                                          ],
                                        ),
                                      )))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
                // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      String a = usu;
      return a;
    }
  }

  Future<String> _validEmail(email, password) async {
    authProblems errorType;
    String res = null;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "OK";
    } catch (e) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          res = "Usuario no encontrado";
          errorType = authProblems.UserNotFound;
          break;
        case 'The password is invalid or the user does not have a password.':
          res = "OK";
          break;
        default:
          print('Case ${e.message} is not yet implemented');
      }
    }
    print("El Error es: $errorType");
    return res;
  }

  Future<String> _validPass(email, password) async {
    authProblems errorType;
    String res = null;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "OK";
    } catch (e) {
      switch (e.message) {
        case 'The password is invalid or the user does not have a password.':
          errorType = authProblems.PasswordNotValid;
          print("Hola");
          res = "Contraseña invalida";
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          errorType = authProblems.NetworkError;
          break;
        default:
          print('Case ${e.message} is not yet implemented');
      }
    }
    print("El Error es: $errorType");
    return res;
  }

  String validarContra(String value) {
    String pattern = r"^[A-Za-z0-9]*$";
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "La contraseña es necesaria";
    } else if (!regExp.hasMatch(value)) {
      return "No se admiten espacios";
    } else {
      String a = contra;
      return a;
    }
  }

  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication goo = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: goo.accessToken, idToken: goo.idToken);
    final UserCredential user = await _auth.signInWithCredential(credential);
    assert(user.user.displayName != null);
    assert(await user.user.getIdToken() != null);
    final User currentUser = await _auth.currentUser;
    assert(user.user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => mainScreen()),
        // );
      }
    });
  }
}
