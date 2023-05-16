// ignore: file_names
import "package:flutter/material.dart";

import "../services/firebase_services.dart";

class AddUsuarioPage extends StatefulWidget {
  const AddUsuarioPage({super.key});

  @override
  State<AddUsuarioPage> createState() => _AddUsuarioPageState();
}


class _AddUsuarioPageState extends State<AddUsuarioPage> {

  TextEditingController nameController = TextEditingController(text:"");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "Add Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             TextField(
            controller: nameController,
              decoration:  const InputDecoration(
                hintText: "Ingrese el nuevo nombre ",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async {
               await addPeople(nameController.text);
              }, child: const Text("Enviar")),
            )
          ],
        ),
      )

    );
  }
}