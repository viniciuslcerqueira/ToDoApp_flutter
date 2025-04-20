import 'package:flutter/material.dart';

class CustomDialogbox extends StatelessWidget {
  const CustomDialogbox({
    super.key,
    required this.controller,
    required this.saveMethod,
    required this.cancelMethod,
  });

  final TextEditingController controller;
  final VoidCallback saveMethod;
  final VoidCallback cancelMethod;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 300,
        child: Column(
          children: [
            Text("New Task", style: TextStyle(fontSize: 20, letterSpacing: 2)),

            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                MaterialButton(
                  elevation: 0,
                  color: Colors.grey[300],
                  onPressed: saveMethod,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                SizedBox(width: 5),

                //Cancel Button
                MaterialButton(
                  elevation: 0,
                  color: Colors.grey[300],
                  onPressed: cancelMethod,
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
