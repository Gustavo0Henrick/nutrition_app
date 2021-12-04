import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nutrition_app/src/cubit/favorite.cubit.dart';
import 'package:nutrition_app/src/modules/dashboard/widgets/grid_food_favorite.dart';
import 'package:nutrition_app/src/modules/dashboard/widgets/list_recipes_favorite.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

int index = 0;
PageController pageController = PageController(initialPage: 0);

class _FavoritePageState extends State<FavoritePage> {
  List list = [];
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    super.initState();
    favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    favoriteCubit.getFavorite(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.white,
          inAsyncCall: state is FavoriteStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Container(
                height: size.height,
                width: size.width,
                child: state is FavoriteStateLoading
                    ? Container(
                        height: size.height,
                        width: size.width,
                        color: AppColors.white,
                      )
                    : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 40, bottom: 40),
                            child: Text(
                              'Favorites',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 45, right: 45, bottom: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 0;
                                      pageController.animateToPage(0,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.decelerate);
                                    });
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: index == 0
                                          ? AppColors.orange
                                          : AppColors.anotherlightOrange,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Food',
                                        style: TextStyle(
                                          color: index == 0
                                              ? AppColors.white
                                              : AppColors.orange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 1;
                                      pageController.animateToPage(1,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.decelerate);
                                    });
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: index == 1
                                          ? AppColors.orange
                                          : AppColors.anotherlightOrange,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Recipes',
                                        style: TextStyle(
                                          color: index == 1
                                              ? AppColors.white
                                              : AppColors.orange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: size.width,
                              child: PageView(
                                children: [
                                  GridFoodFavorite(
                                    size: size,
                                  ),
                                  ListRecipesFavorite(),
                                ],
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (value) {
                                  pageController.animateToPage(value,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
