import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pantallas/codiciones.dart';
import '../pantallas/terminos.dart';

class Registro extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<Registro> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = new GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordRController = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 15.0);

  bool checkboxValue = false;
  bool checkboxValue2 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(5.0),
        child: Scaffold(
            appBar: AppBar(
                title: Text("Registrarse"),
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
                      'Bienvenid@!\nRegistra tu Cuenta',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 300.0,
                                margin: const EdgeInsets.only(bottom: 20.0),
                                child: new TextFormField(
                                  controller: _emailController,
                                  validator: validateEmail,
                                  keyboardType: (TextInputType.emailAddress),
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(25.0),
                                        ),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey[800]),
                                      hintText: "Correo Electronico",
                                      fillColor: Colors.white70),
                                )),
                            Container(
                                margin: const EdgeInsets.only(bottom: 20.0),
                                width: 300.0,
                                child: new TextFormField(
                                  validator: validarContra,
                                  controller: _passwordController,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(25.0),
                                        ),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey[800]),
                                      hintText: "Contraseña",
                                      fillColor: Colors.white70),
                                )),
                            Container(
                                width: 300.0,
                                child: new TextFormField(
                                  controller: _passwordRController,
                                  validator: validarContraR,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(25.0),
                                        ),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey[800]),
                                      hintText: "Confirmar Contraseña",
                                      fillColor: Colors.white70),
                                )),
                            Container(
                              //padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.4
                                  : MediaQuery.of(context).size.height * 0.8,
                              child: CheckboxListTile(
                                value: checkboxValue,
                                onChanged: (val) {
                                  setState(() => checkboxValue = val);
                                  checkboxValue2 = true;
                                },
                                subtitle: !checkboxValue2
                                    ? Text(
                                        'Acepte los términos y condiciones.',
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : null,
                                title: new Text(
                                  'Acepto términos y condiciones.',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.green,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30.0),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                minWidth: 200.0,
                                height: 40.0,
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    if (checkboxValue) {
                                      _signIn(_emailController.text,
                                          _passwordController.text);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Stack(
                                                overflow: Overflow.visible,
                                                children: <Widget>[
                                                  Positioned(
                                                    right: -40.0,
                                                    top: -40.0,
                                                    child: InkResponse(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: CircleAvatar(
                                                        child: Icon(Icons.close,
                                                            color:
                                                                Colors.white),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            'Gracias por registrarte!\nRevisa tu correo para\nverificar tu cuenta ó',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black87)),
                                                        MaterialButton(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .purple)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            color: Colors.white,
                                                            child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                      'Ingresa AQUÍ',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54)),
                                                                ]))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    } else {
                                      setState(() => checkboxValue2 = false);
                                    }
                                  }
                                },
                                color: Colors.purple,
                                child: Text('Registrarse',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
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
                                          style: defaultStyle,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Política de\nprivacidad',
                                                style: linkStyle,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Condiciones()),
                                                        );
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
                                          style: defaultStyle,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Términos y\ncondiciones',
                                                style: linkStyle,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Terminos()),
                                                        );
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
            ))));
  }

  void _signIn(mail, password) async {
    await _auth.createUserWithEmailAndPassword(email: mail, password: password);
  }

  String validarContra(String value) {
    String pattern = r"^[A-Za-z0-9]*$";
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "La contraseña es necesaria";
    } else if (!regExp.hasMatch(value)) {
      return "No se admiten espacios";
    } else {
      return null;
    }
  }

  String validarContraR(String value) {
    String pattern = r"^[A-Za-z0-9]*$";
    RegExp regExp = new RegExp(pattern);
    String a = _passwordController.text;
    if (value.isEmpty) {
      return "La contraseña es necesaria";
    } else if (!regExp.hasMatch(value)) {
      return "No se admiten espacios";
    } else if (a != value) {
      return "Las contraseñas no coinciden";
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Ingrese un correo";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }
}
