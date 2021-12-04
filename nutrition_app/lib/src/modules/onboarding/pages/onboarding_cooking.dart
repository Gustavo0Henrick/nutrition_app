import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class OnBoardingCooking extends StatelessWidget {
  const OnBoardingCooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.cooking,
            placeholderBuilder: (BuildContext context) {
              return Container(
                height: 282,
                width: 282,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Healthy Recipes',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              'Browse thousands of healthy recipes from all over the world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
