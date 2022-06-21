import 'package:bloc/bloc.dart';
import 'package:jobtimer/app/view_models/project_model.dart';

part 'task_state.dart';

class TaskController extends Cubit<TaskStatus> {
  late final ProjectModel _projectModel;
  TaskController() : super(TaskStatus.initial);
  void setProject(ProjectModel projectModel) => _projectModel = projectModel;
}
