import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobtimer/app/modules/home/controller/home_controller.dart';
import 'package:jobtimer/app/modules/home/widgets/drawer_home_page.dart';
import 'package:jobtimer/app/modules/home/widgets/header_projects_menu.dart';
import 'package:jobtimer/app/modules/home/widgets/project_tile.dart';
import 'package:jobtimer/app/view_models/project_model.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar projetos').show();
        }
      },
      child: Scaffold(
        drawer: const DrawerHomePage(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Projetos'),
                expandedHeight: 100,
                toolbarHeight: 100,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
              ),
              BlocSelector<HomeController, HomeState, bool>(
                bloc: controller,
                selector: (state) => state == HomeStatus.loading,
                builder: (context, showLoading) {
                  return SliverVisibility(
                    visible: showLoading,
                    sliver: const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SliverPersistentHeader(
                delegate: HeaderProjectsMenu(
                  controller: controller,
                ),
                pinned: true,
              ),
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                bloc: controller,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                      delegate: SliverChildListDelegate(
                    projects
                        .map((project) => ProjectTile(projectModel: project))
                        .toList(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
