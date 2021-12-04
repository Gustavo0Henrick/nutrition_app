import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/src/cubit/auth.cubit.dart';
import 'package:nutrition_app/src/cubit/favorite.cubit.dart';
import 'package:nutrition_app/src/cubit/home.cubit.dart';
import 'package:nutrition_app/src/cubit/repository/auth.repository.dart';
import 'package:nutrition_app/src/cubit/repository/favorite.repository.dart';
import 'package:nutrition_app/src/cubit/repository/home.repository.dart';
import 'package:nutrition_app/src/cubit/repository/search.repository.dart';
import 'package:nutrition_app/src/cubit/search.cubit.dart';
import 'package:nutrition_app/src/modules/dashboard/dashboard_page.dart';

import 'package:nutrition_app/src/modules/onboarding/onboarding_page.dart';
import 'package:nutrition_app/src/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              HomeCubit(HomeRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) =>
              FavoriteCubit(FavoriteRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) =>
              SearchCubit(SearchRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) =>
              AuthCubit(AuthRepositoryImplementation(context: context)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nutrition App Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/dashboard': (context) => const DashboardPage(),
        },
      ),
    );
  }
}
