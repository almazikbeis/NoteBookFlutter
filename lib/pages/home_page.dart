import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/data/database.dart';
import 'package:test_project/util/dialog_box.dart';
import 'package:test_project/util/todo_til.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
const Color royalBlue = Color(0xFF4169E1);
class _HomePageState extends State<HomePage> {
 final _myBox = Hive.box('mybox');
 ToDoDataBase db = ToDoDataBase();
 
 @override
 void initState(){
  if(_myBox.get("TODOLIST") == null){
    db.createInitialData();

  }
  else{
    db.loadData();
  }
  super.initState();
 }
 
 final _controller = TextEditingController();
  

    void checkBoxChaanged(bool? value,int index){
      setState(() {
        db.toDoList[index] [1] = !db.toDoList[index][1];
      });
    db.updateDataBase();
    }

    void saveNewTask(){
      setState(() {
        db.toDoList.add([_controller.text,false]);
      });
      Navigator.of(context).pop();
      db.updateDataBase();
      _controller.text = "";
    }
    void createNewTask(){
      showDialog(context: context
      
      , builder: (context){
        return DialogBox( 
          controller: _controller ,
          onSave: saveNewTask,
          onCancel:() => Navigator.of(context).pop(),
        );
      });
    }
    void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();

    }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:  Color(0xFFC4DFE6),
      appBar: AppBar(
        backgroundColor: Color(0xFF66A5AD),
        title: Center(
          child: Text('Список ',
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),
      backgroundColor:Color(0xFF66A5AD) ,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: db.toDoList[index][0], taskStatus: db.toDoList[index][1] , onChanged: (value) => checkBoxChaanged(value,index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}