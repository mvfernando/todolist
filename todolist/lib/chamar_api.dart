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

  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  CallAPI() async {
    var client = http.Client();
        try {
          inLoader.value = true;
          var response = await client.get(
              Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          );
          var decodedResponse = jsonDecode(response.body) as List;
          posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
          await Future.delayed(Duration(seconds: 2));
        } finally {
          client.close();
          inLoader.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([posts, inLoader]),
              builder: (_, __) => inLoader.value 
                ? CircularProgressIndicator()
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts.value.length,
                    itemBuilder: (_, idx ) => ListTile(
                      title: Text(posts.value[idx].title),
                  ),
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

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body );

  factory Post.fromJson(Map json){
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  @override
  String toString(){
    return 'id: $id';
  }
}
