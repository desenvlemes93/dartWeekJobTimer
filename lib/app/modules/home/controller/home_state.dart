part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loadgin,
  complete,
  failure;
}

class HomeState extends Equatable {
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
  });

  HomeState.initial()
      : this._(
          projects: [],
          status: HomeStatus.initial,
          projectFilter: ProjectStatus.em_andamento,
        );

  @override
  List<Object?> get props => [projects, status, projectFilter];
}
