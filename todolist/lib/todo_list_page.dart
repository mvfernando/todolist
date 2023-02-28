
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  
  TextEditingController _textEditingController = TextEditingController();
  //Lista de tarefas
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider() ,
                itemCount: tarefas.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                    );
                }),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon (Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
                setState(() {
                  tarefas=[];
                });
                _textEditingController.clear();
            },
            child: Icon (Icons.remove),
          ),
        ],
      ),

    );
  }
}