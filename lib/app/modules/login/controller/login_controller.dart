import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/service/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;
  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(
          const LoginState.initial(),
        );

  Future<void> signIn() async {
    try {      
      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn();
      Modular.to.navigate('/home');

    } catch (e, s) {
      log('Erro ao realizar Login', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.failure,
            errorMessage: 'Erro ao Realizar Login'),
      );
    }
   
  }
}
