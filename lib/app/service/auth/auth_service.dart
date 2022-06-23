import 'package:jobtimer/app/view_models/user_model.dart';

abstract class AuthService {
  Future<void> signIn();
  Future<void> signOut();
}
