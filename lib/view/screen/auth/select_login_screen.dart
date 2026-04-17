import 'package:flipit/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../../custom/my_textfeild.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          CommonImageView(imagePath: Assets.imagesBg1),
          Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: ShapeDecoration(
              color: kQuaternaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Login",
                  size: 27,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 2),
                MyText(
                  text:
                  "Select a method to login to your account",
                  size: 15,
                  weight: FontWeight.w400,
                  color: kTextColor,
                ),
                const SizedBox(height: 15),
                socialLoginButton(
                  onTap: () {


                  },
                  title: "Login with Google",
                  iconPath: Assets.svgGoogle,
                ),
                const SizedBox(height: 10),
                socialLoginButton(
                  onTap: () {

                  },
                  title: "Login with Apple",
                  iconPath: Assets.svgApple,
                ),
                const SizedBox(height: 10),
                socialLoginButton(
                  onTap: () {
                    Get.to(()=>LoginScreen());
                  },
                  title: "Login with Email",
                  iconPath: Assets.svgEmail,
                ),


              ],
            ),
          ),
        ],
      )
    );
  }
  Widget socialLoginButton({
    required VoidCallback onTap,
    required String title,
    required String iconPath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: ShapeDecoration(
          color: kQuaternaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: kBorderColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonImageView(svgPath: iconPath),
            MyText(
              text: title,
              size: 15,
              weight: FontWeight.w600,
              color: kBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}