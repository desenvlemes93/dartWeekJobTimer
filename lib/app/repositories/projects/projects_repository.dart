import 'package:jobtimer/app/entities/project.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/entities/project_task.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status);
  Future<Project> findById(int projectId);
  Future<Project> addTask(int projectId, ProjectTask task);
}
