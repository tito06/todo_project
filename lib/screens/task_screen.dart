import 'package:flutter/material.dart';
import 'package:todo_project/models/task.dart';
import 'package:todo_project/screens/add_task.dart';

import '../blocs/bloc_exports.dart';
import '../widget/task_list.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
 void _addTask(BuildContext context){
  showModalBottomSheet(
    context: context,
     builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: const AddTaskScreen(),
      ),
     )
     );
 }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text("ToDo Project"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [TaskList(taskList: taskList)],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> _addTask(context),
            child: const Icon(Icons.add),
            ),
        );
      },
    );
  }
}


