import 'package:flipit/config/constants/app_fonts.dart';
import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/my_button.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flipit/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    viewInsets.bottom + 16,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: CommonImageView(imagePath: Assets.imagesBackArrowWhite,height: 48,)),
                        const SizedBox(height: 20),
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
                                text: "Create Account",
                                size: 27,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(height: 2),
                              MyText(
                                text:
                                "Provide following details to create your new account",
                                size: 15,
                                weight: FontWeight.w400,
                                color: kTextColor,
                              ),
                              const SizedBox(height: 20),
                              MyTextField(
                                label: "Username",
                                hint: "John Doe",
                              ),
                              MyTextField(
                                label: "Email",
                                hint: "example@email.com",
                              ),
                              MyTextField(
                                label: "Password",
                                hint: "********",
                                marginBottom: 0,
                              ),
                              const SizedBox(height: 8),
                              MyText(
                                text:
                                "Password needs to be at least 7 characters long, including a digit, uppercase, lowercase and a special character",
                                size: 15,
                                weight: FontWeight.w500,
                                color: kText2Color,
                              ),
                              const SizedBox(height: 15),
                              MyButton(
                                onTap: () {
                                  Get.to(()=>LoginScreen());
                                },
                                buttonText: "Create Account",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                Get.to(()=>LoginScreen());
                              },
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 15,
                                        fontFamily: AppFonts.outfit,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
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
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}