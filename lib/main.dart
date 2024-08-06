import 'package:flutter/material.dart';
import 'package:todo_project/screens/task_screen.dart';

import 'blocs/bloc_exports.dart';

void main() {

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
