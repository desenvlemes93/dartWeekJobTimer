import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobtimer/app/service/projects/project_service.dart';
import 'package:jobtimer/app/view_models/project_model.dart';

part 'project_detail_controller.dart';

enum ProjectDetailStatus {
  initial,
  loading,
  complete,
  failure,
}

class ProjectDetailState extends Equatable {
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;
  ProjectDetailState._({
    required this.status,
    this.projectModel,
  });

  ProjectDetailState.initial() : this._(status: ProjectDetailStatus.initial);

  ProjectDetailState copyWith({
    ProjectDetailStatus? status,
    ProjectModel? projectModel,
  }) {
    return ProjectDetailState._(
      status: status ?? this.status,
      projectModel: projectModel ?? this.projectModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        projectModel,
      ];
}
