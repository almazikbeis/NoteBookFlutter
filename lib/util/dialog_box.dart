import 'package:flutter/material.dart';
import 'package:test_project/util/my_button.dart';

class DialogBox extends StatelessWidget{
  // ignore: empty_constructor_bodies
  VoidCallback onSave;
  VoidCallback onCancel;

  final controller;
   DialogBox({super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel

  });

  @override
 Widget build(BuildContext context){
  return AlertDialog(
      backgroundColor: Color(0xFF66A5AD),
      content: Container(height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextField(
          controller:  controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText:"Добавь новую  задачу! "),
        ),
        Row(
          children: [
            MyButton(text: "Сохранить", onPressed: onSave,),
            const SizedBox(width: 4,),
            MyButton(text: "Выйти", onPressed: onCancel,)
          ],
        )

      ]),),
  );
 }
}
 
 

