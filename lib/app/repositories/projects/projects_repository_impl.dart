import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:jobtimer/app/core/database/database.dart';
import 'package:jobtimer/app/entities/project.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/entities/project_task.dart';

import '../../core/exceptions/failure.dart';
import './projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final Database _database;
  const ProjectsRepositoryImpl({
    required Database database,
  }) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      print(project);
      final connection = await _database.openConnection();
      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log(
        'Erro ao cadastrar Projeto',
        error: e,
        stackTrace: s,
      );
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _database.openConnection();
    final project =
        await connection.projects.filter().statusEqualTo(status).findAll();
    return project;
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask task) async {}

  @override
  Future<Project> findById(int projectId) async {}
}
