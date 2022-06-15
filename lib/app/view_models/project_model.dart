import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/view_models/project_task_model.dart';

import '../entities/project.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> taks;
  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.taks,
  });

  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();
    return ProjectModel(
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      taks: project.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
