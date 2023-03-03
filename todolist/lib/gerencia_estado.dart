import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/widgets/custum_button_widget.dart';

class Gerencia_estado extends StatefulWidget {
  const Gerencia_estado({super.key});

  @override
  State<Gerencia_estado> createState() => _Gerencia_estado();
}

class _Gerencia_estado extends State<Gerencia_estado> {

  ValueNotifier <int> valorAleatorio = ValueNotifier <int> (0);

  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio,
              builder: (_, value, __) => Text(
                'Valor é: $value',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 18),
            CustumButtonWidget(
               titleSize: 18,
               disable: false,
               onPressed:() => random(),
               title: 'START',
            )
          ],
        ),
      ),
    );
  }
}