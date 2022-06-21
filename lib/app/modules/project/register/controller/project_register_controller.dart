import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:jobtimer/app/core/exceptions/failure.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/service/projects/project_service.dart';
import 'package:jobtimer/app/view_models/project_model.dart';
part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectService _projectService;
  ProjectRegisterController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        taks: [],
      );
      await _projectService.register(project);
      emit(ProjectRegisterStatus.sucess);
    } catch (e, s) {
      log('Erro ao salvar Project', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
      Failure(message: 'Erro ao salvar Projeto');
    }
  }
}
