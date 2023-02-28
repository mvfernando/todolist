import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/one_page.dart';

class two_page extends StatelessWidget {
  const two_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ir para primeira page'),
        ),
      ),
    );
  }
}