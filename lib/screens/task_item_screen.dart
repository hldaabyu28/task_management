import 'package:flutter/material.dart';
import 'package:task_management/models/task_model.dart';
import 'package:uuid/uuid.dart';


class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _TaskItemScreenState createState() => _TaskItemScreenState();
  
 
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final _taskNameController = TextEditingController();
  String _taskName = '';

  @override
  void initState(){
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        _taskName = _taskNameController.text;
      });
    });
  }

  @override
  void dispose(){
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0,),
        child: ListView(
          children: [
            buildNameField(),
            buildButton(),
          ],
        ),
     )
    );
  }

  Widget buildNameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Task Title'),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'E.g. study',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )
            )
          ),
        )
      ],
    );
  }
  
  Widget buildButton(){
    return ElevatedButton(
      child: const Text('Create Task'),
      onPressed: (){
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          taskName: _taskNameController.text
          );
          widget.onCreate(taskItem);
      },
    );
  }
  
}