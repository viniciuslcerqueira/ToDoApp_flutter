import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, required this.onChanged});

  final Task task;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 20,
      child: ListTile(
        onTap: () {
          onChanged(!task.isDone);
        },
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        leading: Checkbox(value: task.isDone, onChanged: onChanged),
      ),
    );
  }
}
