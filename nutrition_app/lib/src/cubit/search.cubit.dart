import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'repository/home.repository.dart';
import 'repository/search.repository.dart';

part './search.state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepositoryImplementation searchRepositoryImplementation;

  SearchCubit(this.searchRepositoryImplementation)
      : super(SearchStateInitial());

  Future<void> getFavorite(BuildContext context) async {
    emit(SearchStateLoading());
    try {
      await searchRepositoryImplementation.getSearch(context: context);

      emit(SearchStateSuccess());
    } catch (e) {
      emit(SearchStateError(message: e.toString()));
    }
  }
}
