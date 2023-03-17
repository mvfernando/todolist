import 'package:flutter/material.dart';
import 'package:todolist/chamar_api.dart';
import 'package:todolist/custum_component.dart';
import 'package:todolist/gerencia_estado.dart';
import 'package:todolist/one_page.dart';
import 'package:todolist/todo_list_page.dart';
import 'package:todolist/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // desactivar fita adesiva vermelha do app
      //title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const one_page(),
      //segunda forma de definir routas
      initialRoute: '/',
      routes: {
        '/': (context) => const chamar_api(),
        '/Gerencia_estado': (context) => const Gerencia_estado(),
        '/custumComponent_page': (context) => const CustumComponents(),
        '/one_page': (context) => const one_page(),
        '/twopage': (_) => const two_page()
      },
    );
  }
}

