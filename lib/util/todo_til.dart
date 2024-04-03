import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged, 
    required this.deleteFunction
  });

  final String taskName;
  final bool taskStatus;
Function(bool?) onChanged; 
Function(BuildContext)? deleteFunction;  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [SlidableAction(onPressed: deleteFunction,
        icon: Icons.delete,
        backgroundColor: Colors.red.shade300,
        borderRadius: BorderRadius.circular(15),
        )], ),
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          decoration: BoxDecoration(
            color: const Color(0xFF66A5AD),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              
              children: [
                
                Checkbox(
                  value: taskStatus,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  
                ),
                Center(
                  child: Text(taskName,
                  style: TextStyle(
                    fontFamily: 'Montserrat', // Используйте имя шрифта, указанное в pubspec.yaml
                    fontSize: 20,
                    fontWeight: FontWeight.normal, // или FontWeight.bold для полужирного
                    
                  ),),
                ), // Используем переменную taskName
              ],
            ),
          ),
        ),
      ),
    );
  }
}
