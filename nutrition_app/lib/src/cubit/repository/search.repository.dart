import 'package:flutter/cupertino.dart';

abstract class SearchRepository {
  Future getSearch({BuildContext context});
}

class SearchRepositoryImplementation implements SearchRepository {
  final BuildContext context;

  SearchRepositoryImplementation({required this.context});

  @override
  Future getSearch({BuildContext? context}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return 'data';
  }
}
