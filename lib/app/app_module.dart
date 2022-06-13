import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/home/home_module.dart';
import 'package:jobtimer/app/modules/login/login_module.dart';
import 'package:jobtimer/app/modules/splash/splash_page.dart';
import 'package:jobtimer/app/service/auth/auth_service.dart';
import 'package:jobtimer/app/service/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthService>(
          (i) => AuthServiceImpl(),
        ),
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
        
      ];
}
