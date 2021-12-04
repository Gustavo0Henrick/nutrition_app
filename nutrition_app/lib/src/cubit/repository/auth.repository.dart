import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  Future login({BuildContext context});
}

class AuthRepositoryImplementation implements AuthRepository {
  final BuildContext context;

  AuthRepositoryImplementation({required this.context});

  @override
  Future login({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'teste';
  }
}
