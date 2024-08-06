import 'package:flutter/material.dart';

import '../models/task.dart';
import '../blocs/bloc_exports.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index){
          var task  = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value){
                context.read<TaskBloc>().add(UpdateTask(task: task));  
            },),
            onLongPress: ()=> context.read<TaskBloc>().add(DeleteTask(task: task)),
          );
      }),
    );
  }
}