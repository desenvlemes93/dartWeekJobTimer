import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:jobtimer/app/core/database/database.dart';
import 'package:jobtimer/app/entities/project.dart';

import './projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final Database _database;
  ProjectsRepositoryImpl({
    required Database database,
  }) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
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
    }
  }
}