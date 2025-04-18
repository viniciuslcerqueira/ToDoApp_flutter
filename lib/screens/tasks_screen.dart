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

  late TextEditingController taskController;

  @override
  void initState() {
    taskController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Faz o modal não ocupar toda a tela
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 16,
                  right: 16,
                  top: 24,
                ),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // A chave aqui é o mainAxisSize.min
                  children: [
                    Text(
                      "Adicionar nova tarefa",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: taskController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Título da tarefa',
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        String taskTitle = taskController.text.trim();
                        if (taskTitle.isNotEmpty) {
                          setState(() {
                            tasksList.add(
                              Task(title: taskTitle, isDone: false),
                            );
                          });
                          Navigator.pop(context); // Fecha o modal
                        }
                      },
                      child: Text('Adicionar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
                tasksList[index].isDone = newValue!;
              },
            ),
      ),
    );
  }
}
