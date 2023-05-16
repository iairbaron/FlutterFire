import 'package:flutter/material.dart';

//Importaciones de firebase
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import "package:flutter_prueba1000_tutoingles/services/firebase_services.dart";

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
    return const MaterialApp(
      title: 'Flutter Firestore Demo',
      home: AddUser(),
    );
  }
}

//La clase AddUser es también una clase sin estado que define la pantalla principal de la aplicación.
//En su método build(), se crea un objeto Scaffold que contiene una barra de aplicación (AppBar) y
// un cuerpo (body) que es un objeto Column con un título y un formulario de entrada de datos personalizados
// (MyCustomForm).
class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  get data => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Usuario'),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: getPeople(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Deshabilita el desplazamiento del ListView anidado
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data?[index]["name"]);
                  },
                );
              } else {
                print("Documento: $snapshot");
                return const Center(
                  child: Text("No carga"),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          const Padding(
            padding:  EdgeInsets.all(20.0),
            child: MyCustomForm(),
          ),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var nombre = "";
  var telefono = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Cuál es tu nombre",
              labelText: "Nombre",
            ),
            onChanged: (value) {
              nombre = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "por favor escriba su nombre";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: "Cuál es tu teléfono",
              labelText: "Telefono",
            ),
            onChanged: (value) {
              telefono = int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "por favor escriba algo";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Envío Datos Firestore"),
                    ),
                  );
                }
              },
              child: const Text("Enviar"),
            ),
          ),
        ],
      ),
    );
  }
}
