import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Funcion que retorna todos los datos de people de la db
Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReference = db.collection('people');
  //Este get va a traer todo lo de la db, hacer querys especificos
  QuerySnapshot queryGetPeople = await collectionReference.get();
  queryGetPeople.docs.forEach((documento) {
    people.add(documento.data());
  });

  //await Future.delayed(const Duration(seconds: 5));
  return people;
}

//funcion guardar en bd
Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});
}
