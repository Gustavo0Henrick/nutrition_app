import 'package:flutter/cupertino.dart';

abstract class HomeRepository {
  Future getHome({BuildContext context});
}

class HomeRepositoryImplementation implements HomeRepository {
  final BuildContext context;

  HomeRepositoryImplementation({required this.context});

  @override
  Future getHome({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'data';
  }
}
