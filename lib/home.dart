import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home ({super.key});
  @override

  State<Home> createState() => _HomeState();
}
class _HomeState extends State <Home>{
  TextEditingController _Controller=TextEditingController();
  List<String> todoItems=[];
  void _addToDoItem(){
    setState(() {
      if (_Controller.text.isNotEmpty){
        todoItems.add(_Controller.text);
        _Controller.clear();
      }
    });
  }
  void _removeToDoItem(int index){
    setState(() {
      todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context)
  {
  return Scaffold(
    appBar: AppBar(title:Text("ToDO"),
    ),
    body: Column(
    
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child:
              TextField(controller:_Controller,
              decoration : InputDecoration(border: OutlineInputBorder(),label: Text("Enter Text"),
                ),
                ),
              ),
              IconButton(onPressed: (){
                _addToDoItem();
              }, icon: Icon(Icons.add))
            ],
          ),
        ),
        
        Expanded(child: ListView.builder(itemCount: todoItems.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(todoItems[index]),
              trailing: IconButton(onPressed: (){
                _removeToDoItem(index);
              }, icon: Icon(Icons.delete)),
            );
          })),
       
      ],
    ),

  );
}
}