part of 'auth.cubit.dart';

abstract class AuthState {}

class AuthStateInitial implements AuthState {}

class AuthStateError implements AuthState {
  final String message;

  AuthStateError({required this.message});
}

class AuthStateLoading implements AuthState {}

class AuthStateSuccess implements AuthState {}
