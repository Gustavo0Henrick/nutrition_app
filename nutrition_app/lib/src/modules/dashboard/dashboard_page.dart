import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/src/modules/dashboard/pages/favorite_page.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/search_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

int index = 0;

class _DashboardPageState extends State<DashboardPage> {
  void _initPage() {
    index = 0;
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  List pages = [
    const HomePage(),
    const SearchPage(),
    Container(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: pages[index],
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: Container(
          color: AppColors.white,
          height: 80,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: SvgPicture.asset(
                    index == 0 ? AppImages.homeSelected : AppImages.home),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: SvgPicture.asset(
                    index == 1 ? AppImages.searchSelected : AppImages.search),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: SvgPicture.asset(AppImages.camera),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: SvgPicture.asset(index == 3
                    ? AppImages.favoriteSelected
                    : AppImages.favorite),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: SvgPicture.asset(
                    index == 4 ? AppImages.profileSelected : AppImages.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
