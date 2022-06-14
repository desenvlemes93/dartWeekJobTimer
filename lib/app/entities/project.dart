import 'package:isar/isar.dart';
import 'package:jobtimer/app/entities/converters/project_status_converter.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;
  late String name;
  @ProjectStatusConverter()
  late ProjectStatus status;
  final tasks = IsarLinks<ProjectTask>();
}
