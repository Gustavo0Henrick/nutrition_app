import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class GridFoodFavorite extends StatelessWidget {
  final Size size;
  const GridFoodFavorite({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(AppImages.cupcake),
              )),
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(AppImages.burguerIcon),
              )),
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(AppImages.pizzaIcon),
              )),
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(AppImages.cookie),
              )),
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SvgPicture.asset(AppImages.hotdog),
              )),
          Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.anotherlightOrange,
              ),
              padding: const EdgeInsets.all(8),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.lightOrange,
                  size: 48,
                ),
              )),
        ],
      ),
    );
  }
}
