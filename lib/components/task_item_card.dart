import 'package:flutter/material.dart';
import 'package:task_management/models/task_model.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel task ;
  final Function() onPressed;
  
  const TaskItemCard({
    Key? key,
    required this.task, required this.onPressed,
  }) : super(key: key);
  
@override
Widget build(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.amberAccent[100],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Text(task.taskName),
        IconButton(
          onPressed: (){
            showDialog(
              context: context, 
              builder: (context)=> AlertDialog(
                content: const Text('Are You Sure?'),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: onPressed, 
                    child: const Text('YES'),
                  )
                ],
              ) 
              );
          }, 
          icon: const Icon(Icons.delete_forever_rounded)),
      ],
    ),
  );
}
}
