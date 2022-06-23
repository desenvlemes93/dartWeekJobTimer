import 'package:flutter/material.dart';
import 'package:jobtimer/app/entities/project_task.dart';
import 'package:jobtimer/app/view_models/project_task_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskModel task;
  const ProjectTaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.name,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${task.duration}h',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(text: '        '),
                TextSpan(
                  text: '4h',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
