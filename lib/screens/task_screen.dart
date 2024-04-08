import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/components/profile_sheet.dart';
import 'package:task_management/models/task_manager.dart';
import 'package:task_management/screens/empty_task_screen.dart';
import 'package:task_management/screens/task_item_screen.dart';
import 'package:task_management/screens/task_list_scren.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen ({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management', 
        style: TextStyle(
          color: Colors.white),),
        actions: [
          IconButton(
            onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ), 
              context: context ,
              builder: (context) => const ProfileSheet(),
            );
          },
          icon: const Icon(Icons.account_circle, color: Colors.white,),
          )
        ],
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 62, 1, 194),
      ),
      body: 
      buildTaskScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(
                onCreate: (task){
                  manager.addTask(task);
                  Navigator.pop(context);
                },
              ),
            )
          );
        },
      ),
    );

  }
  Widget buildTaskScreen(){
    return Consumer<TaskManager>(
      builder: (context, manager, child){
        if (manager.taskModels.isNotEmpty){
          return TaskListScreen(
            manager: manager,
          );
        }else{
          return const EmptyTaskScreen();
        }
      }
    );
  } 
}