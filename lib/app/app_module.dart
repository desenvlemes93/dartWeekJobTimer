import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/core/database/database.dart';
import 'package:jobtimer/app/core/database/database_impl.dart';
import 'package:jobtimer/app/modules/home/home_module.dart';
import 'package:jobtimer/app/modules/login/login_module.dart';
import 'package:jobtimer/app/modules/project/project_module.dart';
import 'package:jobtimer/app/modules/splash/splash_page.dart';
import 'package:jobtimer/app/repositories/projects/projects_repository.dart';
import 'package:jobtimer/app/repositories/projects/projects_repository_impl.dart';
import 'package:jobtimer/app/service/auth/auth_service.dart';
import 'package:jobtimer/app/service/auth/auth_service_impl.dart';
import 'package:jobtimer/app/service/projects/project_service.dart';
import 'package:jobtimer/app/service/projects/project_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
        Bind.lazySingleton<ProjectsRepository>(
            (i) => ProjectsRepositoryImpl(database: i())),
        Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(projectsRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/project',
          module: ProjectModule(),
        ),
      ];
}
