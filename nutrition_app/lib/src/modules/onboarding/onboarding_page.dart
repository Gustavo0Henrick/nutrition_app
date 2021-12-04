import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nutrition_app/src/cubit/auth.cubit.dart';
import 'package:nutrition_app/src/widgets/dots_indicators.dart';
import 'package:nutrition_app/src/modules/onboarding/pages/onboarding_cooking.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

import 'pages/onboarding_eating.dart';
import 'pages/onboarding_mobile.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

int index = 0;

class _OnBoardingPageState extends State<OnBoardingPage> {
  late AuthCubit authCubit;
  bool _loginSuccess = false;

  bool isAuth = false;
  checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    List<BiometricType> availableBiometrics = [];
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }
    print("biometric is available: $canCheckBiometrics");

    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    print("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $ab");
      });
    } else {
      print("no biometrics are available");
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Touch your finger on the sensor to login',
        useErrorDialogs: true,
        stickyAuth: false,
        biometricOnly: true,
      );
    } catch (e) {
      print("error using biometric auth: $e");
      auth.stopAuthentication();
    }

    setState(() {
      isAuth = authenticated ? true : false;
    });

    print("authenticated: $authenticated");
    return authenticated;
  }

  void _login() async {
    await authCubit.login(context);

    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  _signIn(BuildContext context) async {
    bool isAuthenticated = await checkBiometric();

    if (isAuthenticated) {
      _login();
    } else {
      var snackBar = const SnackBar(
        content: Text('Error authenticating using Biometrics.'),
        duration: Duration(milliseconds: 2500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.transparent,
          inAsyncCall: state is AuthStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(AppImages.kcalGreenMini),
                    CarouselSlider(
                      items: const [
                        OnBoardingEating(),
                        OnBoardingCooking(),
                        OnBoardingMobile(),
                      ],
                      options: CarouselOptions(
                        onPageChanged: (value, carousel) {
                          setState(() {
                            index = value;
                          });
                        },
                        autoPlay: true,
                        initialPage: 0,
                        aspectRatio: 1,
                        viewportFraction: 1.0,
                      ),
                    ),
                    DotsIndicators(index: index),
                    Container(
                      child: Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {},
                            child: Container(
                              width: 290,
                              height: 70,
                              decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already Have An Acount?',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _signIn(context),
                                    // onTap: () {
                                    //   Navigator.pushReplacementNamed(
                                    //       context, '/dashboard');
                                    // },
                                    child: const Text(
                                      ' Log In',
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
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
