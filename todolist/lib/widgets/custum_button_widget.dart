import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustumButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? titleSize;
  final bool disable;

  
  const CustumButtonWidget({
      Key? key,
      required this.onPressed,
      required this.title,
      this.titleSize,
      this.disable = false,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed, 
      child: Text(title),
      style: ButtonStyle(
        //alignment: ,
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) return Colors.red;
          if (states.contains(MaterialState.pressed)) return Colors.blue;
          
          return Colors.black87;
        }), 
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        ),
        //textStyle: MaterialStateProperty.all(TextStyle(fontSize: titleSize)),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) return TextStyle(fontSize: titleSize != null ? titleSize! * 2 : 22);
          return TextStyle(fontSize: titleSize);
        }),
      ),
    );
  }
}