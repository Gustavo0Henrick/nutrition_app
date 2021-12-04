import 'package:flutter/cupertino.dart';

abstract class HomeRepository {
  Future getFavorite({BuildContext context});
}

class FavoriteRepositoryImplementation implements HomeRepository {
  final BuildContext context;

  FavoriteRepositoryImplementation({required this.context});

  @override
  Future getFavorite({BuildContext? context}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return 'data';
  }
}
