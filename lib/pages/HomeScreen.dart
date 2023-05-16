import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
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
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/add");
      },
      child: const Icon(Icons.add),
      
      ),
    );
  }
}
