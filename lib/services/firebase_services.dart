// Importamos el paquete cloud_firestore que nos permite interactuar con Cloud Firestore
import "package:cloud_firestore/cloud_firestore.dart";

// Creamos una instancia de Firestore que nos permite acceder a la base de datos de Firestore
FirebaseFirestore db = FirebaseFirestore.instance;

// Función asincornica para obtener la lista de personas
Future<List> getPeople() async {
  // Creamos una lista vacía llamada people
  List people = [];

  // Obtenemos una referencia a la colección "people" en Firestore mediante el método collection de
  //la instancia de Firestore que creamos anteriormente
  CollectionReference collectionReferencePeople = db.collection("people");

  // Obtenemos un QuerySnapshot mediante el método get de la referencia a la colección "people".
  // Esto nos devuelve todos los documentos en la colección "people"
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  // Agregamos cada documento a la lista de personas
  for (var documento in queryPeople.docs) {
    people.add(documento.data());
    print(documento.data());
  }

  // Finalmente, retornamos la lista people desde la función
  return people;
}



//El objeto QuerySnapshot contiene una lista de objetos QueryDocumentSnapshot,
// donde cada QueryDocumentSnapshot representa un documento en la colección.
//Podemos acceder a los datos de un documento utilizando el método data() de un QueryDocumentSnapshot.
