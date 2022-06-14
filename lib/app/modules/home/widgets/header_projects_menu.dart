import 'package:flutter/material.dart';
import 'package:jobtimer/app/entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
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
                  onChanged: (value) {}),
            ),
            SizedBox(
              width: constraints.maxWidth * .3,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Novo Projeto'),
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
