import 'package:jobtimer/app/entities/project_task.dart';

class ProjectTaskModel {
  int? id;
  String name;
  int duration;
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
      name: task.name,
      duration: task.duration,
    );
  }
}
