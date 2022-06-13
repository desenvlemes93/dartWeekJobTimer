import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/home/home_module.dart';
import 'package:jobtimer/app/modules/login/controller/login_controller.dart';
import 'package:jobtimer/app/modules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds =>
      [BlocBind.lazySingleton((i) => LoginController(authService: i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/login',
          child: (context, args) => LoginPage(controller: Modular.get()),
        ),
        ModuleRoute('/home', module: HomeModule())
      ];
}