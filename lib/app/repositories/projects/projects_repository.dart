import 'package:jobtimer/app/entities/project.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);
}
