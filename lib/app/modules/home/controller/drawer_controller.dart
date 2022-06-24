import 'package:bloc/bloc.dart';
import 'package:jobtimer/app/view_models/user_model.dart';

part 'drawer_state.dart';

class DrawerController extends Cubit<DrawerState> {
  DrawerController() : super(DrawerState.initial());
}
