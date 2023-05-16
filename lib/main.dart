import 'package:flutter/material.dart';

//Importaciones de firebase
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_prueba1000_tutoingles/pages/HomeScreen.dart';
import 'package:flutter_prueba1000_tutoingles/pages/addUsuario.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Firestore Demo',
      initialRoute: "/",
      routes: {
        "/":(context) => const  AddUser(),
        "/add": (context) => const AddUsuarioPage(),
      } ,
    );
  }
}