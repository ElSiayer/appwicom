import 'package:appwicom/pantallas/pantallaPrincipal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './pantallas/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Wicome',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrimeraPantalla(),
    );
  }
}

class PrimeraPantalla extends StatefulWidget {
  @override
  _PrimeraPantallaState createState() => _PrimeraPantallaState();
}

class _PrimeraPantallaState extends State<PrimeraPantalla> {
  FirebaseAuth _firebaseAuth;

  @override
  Widget build(BuildContext context) {
    if (isSignedIn()) {
      return MainScreen();
    } else {
      return LoginPage(title: 'Log In');
    }
  }

  bool isSignedIn() {
    try {
      final currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
    } catch (e) {
      return false;
    }
  }
}
