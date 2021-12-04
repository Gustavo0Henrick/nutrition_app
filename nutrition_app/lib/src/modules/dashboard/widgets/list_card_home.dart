import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class ListCardHome extends StatelessWidget {
  final Size size;
  const ListCardHome({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      Container(
        width: 180,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.lightRed,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.strawberry,
              height: 60,
              width: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Fruits',
                style: TextStyle(
                  color: AppColors.darkBrow,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 180,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.lightGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.broccoli,
              height: 60,
              width: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Vegetable',
                style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 180,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.lightYellow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.pizza,
              height: 60,
              width: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Vegetable',
                style: TextStyle(
                  color: AppColors.brow,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return Container(
      height: 190,
      width: size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: list[index],
          );
        },
      ),
    );
  }
}
