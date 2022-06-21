part of 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  ProjectDetailController() : super(ProjectDetailState.initial());

  void setProject(ProjectModel projectModel) {
    emit(state.copyWith(
        projectModel: projectModel, status: ProjectDetailStatus.complete));
  }
}
