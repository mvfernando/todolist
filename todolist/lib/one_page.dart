import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/two_page.dart';

class one_page extends StatelessWidget {
  const one_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
              .pushNamed('/twopage', arguments: '123').then (
                (value) => print(value));
            },
            child: Text('Ir para segunda page'),
        ),
      ),
    );
  }
}