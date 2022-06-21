import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/modules/home/controller/home_controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  final HomeController controller;
  HeaderProjectsMenu({
    required this.controller,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        height: constraints.maxHeight,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * .5,
              child: DropdownButtonFormField<ProjectStatus>(
                  value: ProjectStatus.em_andamento,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                  items: ProjectStatus.values
                      .map(
                        (listProcedimento) => DropdownMenuItem(
                          value: listProcedimento,
                          child: Text(
                            listProcedimento.label,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (status) {
                    if (status != null) {
                      controller.filter(status);
                    }
                  }),
            ),
            SizedBox(
              width: constraints.maxWidth * .3,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Modular.to.pushNamed('/project/register');
                  controller.loadProjects();
                },
                icon: const Icon(Icons.add),
                label: const Text('Novo Projeto'),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
