import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/one_page.dart';

class two_page extends StatelessWidget {
  //final String args;
  const two_page({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white70,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop('Retorno');
              }
              
            },
            child: Text('Ir para page anterior $args'),
        ),
      ),
    );
  }
}