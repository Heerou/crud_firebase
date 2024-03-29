import 'package:crud_firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      //Se hace una promesa que traera una lista de la db
      body: FutureBuilder(
          future: getPeople(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data?[index]['name']);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        //Recarga el home, al ser async, el espera a terminar la peticion
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          //vuelve a setear el widget
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
