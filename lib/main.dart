import 'package:flutter/material.dart';
import 'package:todolist_app/screens/tasks_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: TasksScreen(),
    );
  }
}
