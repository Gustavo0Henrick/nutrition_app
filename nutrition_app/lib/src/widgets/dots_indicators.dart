import 'package:flutter/material.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';

class DotsIndicators extends StatelessWidget {
  int index;
  DotsIndicators({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            height: index == 0 ? 10 : 8,
            width: index == 0 ? 20 : 12,
            decoration: BoxDecoration(
                color: index == 0 ? AppColors.orange : AppColors.lightOrange,
                borderRadius: BorderRadius.circular(20)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            height: index == 1 ? 10 : 8,
            width: index == 1 ? 20 : 12,
            decoration: BoxDecoration(
                color: index == 1 ? AppColors.orange : AppColors.lightOrange,
                borderRadius: BorderRadius.circular(20)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            height: index == 2 ? 10 : 8,
            width: index == 2 ? 20 : 12,
            decoration: BoxDecoration(
                color: index == 2 ? AppColors.orange : AppColors.lightOrange,
                borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
