import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'repository/favorite.repository.dart';

part './favorite.state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepositoryImplementation favoriteRepositoryImplementation;

  FavoriteCubit(this.favoriteRepositoryImplementation)
      : super(FavoriteStateInitial());

  Future<void> getFavorite(BuildContext context) async {
    emit(FavoriteStateLoading());
    try {
      await favoriteRepositoryImplementation.getFavorite(context: context);

      emit(FavoriteStateSuccess());
    } catch (e) {
      emit(FavoriteStateError(message: e.toString()));
    }
  }
}
