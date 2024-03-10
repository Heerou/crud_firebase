//Pages
import 'package:crud_firebase/pages/add_name_page.dart';
import 'package:crud_firebase/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'services/firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //rutas
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddNamePage(),
      },
    );
  }
}
