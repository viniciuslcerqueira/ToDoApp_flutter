import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_app/widgets/task_tile.dart';
import 'package:todolist_app/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasksList = [
    Task(title: "Go to the gym", isDone: false),
    Task(title: "Study Math", isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'MINHAS TAREFAS',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder:
            (context, index) => TaskTile(
              task: tasksList[index],
              onChanged: (newValue) {
                tasksList[index].isDone = newValue!;
              },
            ),
      ),
    );
  }
}
