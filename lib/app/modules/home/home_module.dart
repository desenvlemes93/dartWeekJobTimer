import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/home',
          child: (context, args) => const HomePage(),
        )
      ];
}
