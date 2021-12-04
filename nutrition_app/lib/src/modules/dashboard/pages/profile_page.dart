import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/src/modules/dashboard/widgets/profile_list_tile.dart';
import 'package:nutrition_app/src/themes/app_colors.dart';
import 'package:nutrition_app/src/themes/app_images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _confirmedLogout() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Do you really want to log out?'),
                ],
              ),
            ),
            actions: <Widget>[
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/onboarding');
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(color: AppColors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        },
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                radius: 98,
                child: Icon(
                  Icons.person,
                  color: AppColors.darkGrey,
                  size: 84,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Column(
                    children: const [
                      Text(
                        'User Name',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Food Blogger',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileListTile(
                          function: () {},
                          title: 'Edit Profile',
                          icon: AppImages.profileRed),
                      ProfileListTile(
                          function: () {},
                          title: 'Renew Plans',
                          icon: AppImages.star),
                      ProfileListTile(
                          function: () {},
                          title: 'Settings',
                          icon: AppImages.settings),
                      ProfileListTile(
                          function: () {},
                          title: 'Terms & Privacy Policy',
                          icon: AppImages.terms),
                      ProfileListTile(
                        function: () {
                          _confirmedLogout();
                        },
                        title: 'Log Out',
                        icon: AppImages.logout,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
