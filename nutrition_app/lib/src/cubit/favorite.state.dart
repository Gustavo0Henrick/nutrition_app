part of 'favorite.cubit.dart';

abstract class FavoriteState {}

class FavoriteStateInitial implements FavoriteState {}

class FavoriteStateError implements FavoriteState {
  final String message;

  FavoriteStateError({required this.message});
}

class FavoriteStateLoading implements FavoriteState {}

class FavoriteStateSuccess implements FavoriteState {}
