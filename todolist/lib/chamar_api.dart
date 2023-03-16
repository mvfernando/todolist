import 'dart:convert';
import 'dart:math';

//import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/widgets/custum_button_widget.dart';

class chamar_api extends StatefulWidget {
  const chamar_api({super.key});

  @override
  State<chamar_api> createState() => _chamar_api();
}

class _chamar_api extends State<chamar_api> {

  ValueNotifier <int> valorAleatorio = ValueNotifier <int> (0);

  CallAPI() async {
    var client = http.Client();
        try {
          var response = await client.get(
              Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          );
          var decodedResponse = jsonDecode(response.body);
          print(decodedResponse);
        } finally {
          client.close();
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
               onPressed:() => CallAPI(),
               title: 'START',
            )
          ],
        ),
      ),
    );
  }
}