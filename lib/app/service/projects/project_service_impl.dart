import 'package:jobtimer/app/entities/project.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/entities/project_task.dart';
import 'package:jobtimer/app/repositories/projects/projects_repository.dart';
import 'package:jobtimer/app/view_models/project_model.dart';
import 'package:jobtimer/app/view_models/project_task_model.dart';

import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectsRepository _projectsRepository;
  ProjectServiceImpl({
    required ProjectsRepository projectsRepository,
  }) : _projectsRepository = projectsRepository;
  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectsRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectsRepository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }

  @override
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task) async {
    final projectTask = ProjectTask()
      ..name = task.name
      ..duration = task.duration;
    final project = await _projectsRepository.addTask(projectId, projectTask);

    return ProjectModel.fromEntity(project);
  }

  @override
  Future<ProjectModel> findById(int projectId) async {
    final project = await _projectsRepository.findById(projectId);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<void> finish(int projectId) => _projectsRepository.findById(projectId);
}
