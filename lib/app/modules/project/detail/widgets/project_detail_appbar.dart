import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/view_models/project_model.dart';

class ProjectDetailAppbar extends SliverAppBar {
  ProjectDetailAppbar({required ProjectModel projectModel, super.key})
      : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: Text(projectModel.name),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(children: [
            Align(
              alignment: Alignment(0, 1.6),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${projectModel.taks.length} tasks'),
                        Visibility(
                          visible:
                              projectModel.status != ProjectStatus.finalizado,
                          replacement: const Text('Projeto Finalizado'),
                          child: _NewTasks(projectModel: projectModel),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
}

class _NewTasks extends StatelessWidget {
  final ProjectModel projectModel;
  const _NewTasks({Key? key, required this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/project/task/', arguments: projectModel);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Text('Adicionar Task'),
        ],
      ),
    );
  }
}
