import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'repository/home.repository.dart';

part './home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImplementation homeRepositoryImplementation;

  HomeCubit(this.homeRepositoryImplementation) : super(HomeStateInitial());

  Future<void> getFavorite(BuildContext context) async {
    emit(HomeStateLoading());
    try {
      await homeRepositoryImplementation.getHome(context: context);

      emit(HomeStateSuccess());
    } catch (e) {
      emit(HomeStateError(message: e.toString()));
    }
  }
}
