// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'view/cadastro.dart';
import 'view/exibir.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => MyCadastro(),
        '/lista': (context) => MyLista(),
      },
    );
  }
}
