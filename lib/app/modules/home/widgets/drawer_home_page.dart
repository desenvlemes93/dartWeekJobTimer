import 'package:flutter/material.dart';

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Text('Sair'),
    );
  }
}
