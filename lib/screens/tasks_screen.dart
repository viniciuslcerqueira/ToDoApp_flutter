import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_app/widgets/custom_dialogbox.dart';
import 'package:todolist_app/widgets/task_tile.dart';
import 'package:todolist_app/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _controller = TextEditingController();

  List<Task> tasksList = [
    Task(title: "Go to the gym", isDone: false),
    Task(title: "Study Math", isDone: false),
  ];

  late TextEditingController taskController;

  void saveNewTask() {
    final newtitle = _controller.text;

    if (newtitle.isEmpty) return;

    setState(() {
      tasksList.add(Task(title: newtitle, isDone: false));
      print('Tarefa adicionada: $newtitle');
    });

    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialogbox(
          controller: _controller,
          saveMethod: saveNewTask,
          cancelMethod: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

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
                setState(() {
                  tasksList[index].isDone = newValue!;
                });
              },
            ),
      ),
    );
  }
}
