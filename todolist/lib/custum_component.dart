import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/widgets/custum_button_widget.dart';

class CustumComponents extends StatelessWidget {
  const CustumComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustumButtonWidget(
          titleSize: 18,
          disable: false,
          onPressed:() {},
          title: 'Custum BTN', ),
      ),

    );
  }
}