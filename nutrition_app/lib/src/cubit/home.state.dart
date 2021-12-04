part of 'home.cubit.dart';

abstract class HomeState {}

class HomeStateInitial implements HomeState {}

class HomeStateError implements HomeState {
  final String message;

  HomeStateError({required this.message});
}

class HomeStateLoading implements HomeState {}

class HomeStateSuccess implements HomeState {}
