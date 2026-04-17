import 'package:flipit/config/constants/app_fonts.dart';
import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/my_button.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flipit/view/screen/auth/create_account_screen.dart';
import 'package:flipit/view/screen/auth/forgot_screen.dart';
import 'package:flipit/view/screen/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                  child: CommonImageView(imagePath: Assets.imagesBackArrowWhite,height: 48,)),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: Colors.white,
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
                    SizedBox(height: 2,),
                    MyText(
                      text: "Enter your credentials to login to your account",
                      size: 15,
                      weight: FontWeight.w400,
                      color: kTextColor,
                    ),
                    SizedBox(height: 20,),
                    MyTextField(label: "Email",hint: "example@email.com",),
                    MyTextField(label: "Password",hint: "********",marginBottom: 0,),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=> ForgotScreen());
                        },
                        child: MyText(
                          text: "Forgot Password",
                          size: 15,
                          weight: FontWeight.w600,
                          color: kBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    MyButton(onTap: (){
                      Get.to(()=>BottomNavBarScreen());
                    }, buttonText: "Login"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: kQuaternaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>CreateAccountScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                              fontFamily:  AppFonts.outfit,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Create Account',
                            style: TextStyle(
                              color: kBlueColor,
                              fontSize: 15,
                              fontFamily: AppFonts.outfit,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),


              // your widgets here
            ],
          ),
        ),
      ),
    );
  }
}