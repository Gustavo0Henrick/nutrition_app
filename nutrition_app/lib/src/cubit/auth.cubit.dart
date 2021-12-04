import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutrition_app/src/cubit/repository/auth.repository.dart';

part './auth.state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryImplementation authRepositoryImplementation;

  AuthCubit(this.authRepositoryImplementation) : super(AuthStateInitial());

  Future<void> login(BuildContext context) async {
    emit(AuthStateLoading());
    try {
      await authRepositoryImplementation.login(context: context);

      emit(AuthStateSuccess());
    } catch (e) {
      emit(AuthStateError(message: e.toString()));
    }
  }
}
