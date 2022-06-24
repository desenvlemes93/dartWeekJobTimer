import 'package:flutter/material.dart';
import 'package:jobtimer/app/view_models/user_model.dart';

class DrawerHomePage extends StatelessWidget {
  final UserModel? _userModel;
  const DrawerHomePage({Key? key, UserModel? userModel})
      : _userModel = userModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  _userModel!.imgAvatar,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _userModel!.displayName,
                    //  user.name,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(''),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
