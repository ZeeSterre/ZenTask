import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ZenTask extends StatelessWidget {
  const ZenTask({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              // backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 165, 188, 166),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: const Color.fromARGB(255, 165, 188, 166),
                activeColor: Color.fromARGB(255, 249, 248, 243),
                side: BorderSide(color: Colors.white),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Color.fromARGB(255, 249, 248, 243),
                  fontSize: 18,
                  decoration:
                      taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
