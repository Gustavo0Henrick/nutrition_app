import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nutrition_app/src/cubit/home.cubit.dart';
import 'package:nutrition_app/src/modules/dashboard/widgets/list_card_home.dart';
import 'package:nutrition_app/src/modules/dashboard/widgets/slide_card.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';
import 'package:nutrition_app/src/widgets/dots_indicators.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int index = 0;

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getFavorite(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.white,
          inAsyncCall: state is HomeStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Container(
                height: size.height,
                width: size.width,
                child: state is HomeStateLoading
                    ? Container(
                        height: size.height,
                        width: size.width,
                        color: AppColors.white,
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 45, bottom: 20),
                            child: Container(
                              child: Column(
                                children: const [
                                  Text(
                                    'Hello User,',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.green,
                                    ),
                                  ),
                                  Text(
                                    'Find, track and eat heathy food.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            child: Column(
                              children: [
                                CarouselSlider(
                                  items: const [
                                    SlideCard(),
                                    SlideCard(),
                                    SlideCard(),
                                  ],
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      initialPage: 0,
                                      aspectRatio: 2.3,
                                      onPageChanged: (value, carousel) {
                                        setState(() {
                                          index = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 15),
                            child: DotsIndicators(index: index),
                          ),
                          Container(
                            height: 90,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.purple,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 140,
                                  child: const Text(
                                    'Track Your Weekly Progress',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'View Now',
                                          style: TextStyle(
                                            color: AppColors.purple,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          AppImages.miniPlay,
                                          color: AppColors.purple,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35, top: 25, bottom: 15),
                            child: Row(
                              children: const [
                                Text(
                                  'Choose Your Favorites',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListCardHome(size: size),
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
