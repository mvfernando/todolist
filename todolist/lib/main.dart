import 'package:flutter/material.dart';
import 'package:todolist/one_page.dart';
import 'package:todolist/todo_list_page.dart';

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
      home: const one_page(),
    );
  }
}


