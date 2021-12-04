part of 'search.cubit.dart';

abstract class SearchState {}

class SearchStateInitial implements SearchState {}

class SearchStateError implements SearchState {
  final String message;

  SearchStateError({required this.message});
}

class SearchStateLoading implements SearchState {}

class SearchStateSuccess implements SearchState {}
