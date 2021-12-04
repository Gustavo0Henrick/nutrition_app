import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class ListRecipesFavorite extends StatelessWidget {
  const ListRecipesFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppImages.foodiesIcon),
          Container(
            child: Column(
              children: [
                const Text(
                  'No Recipes Found',
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 300,
                    child: const Text(
                      'You don’t save any food. Go ahead, search and save your favorite food',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Container(
              height: 70,
              width: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.green,
              ),
              child: const Center(
                child: Text(
                  'Search Recipes',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
